
FROM node:16-buster-slim

ARG __BUILD_DIR__="/build"
ARG __USER__="root"
ARG __WORK_DIR__="/root"

ENV \
    LANG="C.UTF-8" \
    LC_ALL="C.UTF-8"

USER ${__USER__}

COPY "./" "${__WORK_DIR__}/"

RUN mkdir -p "${__WORK_DIR__}/" "${__BUILD_DIR__}/"

# Download all base packages except dev
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    cd "${__WORK_DIR__}/" && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/setup-1.9.2-1.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/filesystem-1.3.2-3.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/basesystem-4.9-3.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/ldconfig-1.9.5-8.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/glibc-2.0.7-29.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/mktemp-1.4-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/termcap-9.12.6-11.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/libtermcap-2.0.8-10.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/bash-1.14.7-13.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/ncurses-4.2-10.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/zlib-1.1.3-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/info-3.12-9.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/fileutils-3.16-10.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/grep-2.2-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/ash-0.2-12.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/chkconfig-0.9.6-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/at-3.1.7-4.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/bc-1.05a-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/bdflush-1.5-8.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/binutils-2.9.1.0.15-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/bootpc-061-8.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/e2fsprogs-1.12-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/rmt-0.3-14.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/cpio-2.4.2-9.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/cracklib-2.7-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/cracklib-dicts-2.7-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/crontabs-1.7-3.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/shadow-utils-980403-4.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/dhcpcd-0.70-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/diffutils-2.7-11.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/ed-0.2-8.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/eject-1.5-4.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/etcskel-1.3-6.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/file-3.25-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/findutils-4.1-25.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/gawk-3.0.3-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/gd-1.3-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/gdbm-1.7.3-17.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/getty_ps-2.0.7j-4.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/glib-1.0.6-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/gpm-1.13-8.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/groff-1.11a-6.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/gzip-1.2.4-12.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/hdparm-3.3-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/initscripts-3.78-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/isapnptools-1.15a-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/kbd-0.96a-8.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/kbdconfig-1.8.3-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/kernel-2.0.36-0.7.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/kernel-pcmcia-cs-2.0.36-0.7.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/ld.so-1.9.5-8.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/less-332-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/libc-5.3.12-27.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/libg++-2.7.2.8-9.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/libstdc++-2.8.0-14.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/lilo-0.20-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/pwdb-0.55-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/sed-3.02-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/pamconfig-0.51-5.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/pam-0.64-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/sh-utils-1.16-14.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/textutils-1.22-7.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/logrotate-2.6-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/losetup-2.8a-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/mailcap-1.0-9.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/mailx-8.1.1-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/man-1.5f-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/mingetty-0.9.4-8.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/mkbootdisk-1.1-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/mkinitrd-1.8-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/modutils-2.1.85-9.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/mount-2.8a-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/mouseconfig-3.1.3-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/mt-st-0.5-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/ncompress-4.2.4-11.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/net-tools-1.46-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/newt-0.30-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/ntsysv-0.9.6-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/passwd-0.50-11.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/perl-5.004m4-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/procmail-3.10-13.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/procps-1.2.9-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/psmisc-17-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/python-1.5.1-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/pythonlib-1.22-2.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/quota-1.55-9.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/readline-2.2.1-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/redhat-release-5.2-1.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/rhs-hwdiag-0.30-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/rootfiles-5.2-2.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/rpm-2.5.5-5.2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/sash-2.1-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/setconsole-1.0-5.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/setserial-2.14-4.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/setuptool-1.0-1.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/slang-0.99.38-8.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/stat-1.5-8.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/sysklogd-1.3-25.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/SysVinit-2.74-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/tar-1.12-4.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/tcsh-6.07.09-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/time-1.7-6.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/timeconfig-2.5-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/tmpwatch-1.5.1-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/util-linux-2.8-11.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/vim-common-5.3-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/vim-minimal-5.3-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/vixie-cron-3.0.1-26.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/which-1.0-8.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/words-2-11.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/MAKEDEV-2.3.1-7.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/gecko-1.6-0.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/linuxconf-1.12r5-6rh.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/sendmail-8.8.7-20.i386.rpm && \
    true

# Second stage of Dockerfile
FROM ghcr.io/uyjulian/rhl_5_2_container:latest

ARG __WORK_DIR__="/root"
ARG __BUILD_DIR__="/build"

RUN mkdir -p "${__BUILD_DIR__}/"
COPY --from=0 "${__WORK_DIR__}" "${__WORK_DIR__}"
RUN mkdir -p "${__BUILD_DIR__}/"/var/lib/rpm && \
    rpm --root "${__BUILD_DIR__}/" --initdb && \
    mkdir "${__BUILD_DIR__}/"/dev && \
    mkdir "${__BUILD_DIR__}/"/etc && \
    touch "${__BUILD_DIR__}/"/etc/ld.so.conf && \
    cd "${__WORK_DIR__}" && \
    rpm --verbose --root "${__BUILD_DIR__}/" --install --ignorearch --noorder \
        setup-1.9.2-1.noarch.rpm \
        filesystem-1.3.2-3.noarch.rpm \
        basesystem-4.9-3.noarch.rpm \
        ldconfig-1.9.5-8.i386.rpm \
        glibc-2.0.7-29.i386.rpm \
        mktemp-1.4-3.i386.rpm \
        termcap-9.12.6-11.noarch.rpm \
        libtermcap-2.0.8-10.i386.rpm \
        bash-1.14.7-13.i386.rpm \
        ncurses-4.2-10.i386.rpm \
        zlib-1.1.3-2.i386.rpm \
        info-3.12-9.i386.rpm \
        fileutils-3.16-10.i386.rpm \
        grep-2.2-2.i386.rpm \
        ash-0.2-12.i386.rpm \
        chkconfig-0.9.6-1.i386.rpm \
        at-3.1.7-4.i386.rpm \
        bc-1.05a-1.i386.rpm \
        bdflush-1.5-8.i386.rpm \
        binutils-2.9.1.0.15-1.i386.rpm \
        bootpc-061-8.i386.rpm \
        e2fsprogs-1.12-2.i386.rpm \
        rmt-0.3-14.i386.rpm \
        cpio-2.4.2-9.i386.rpm \
        cracklib-2.7-2.i386.rpm \
        cracklib-dicts-2.7-2.i386.rpm \
        crontabs-1.7-3.noarch.rpm \
        shadow-utils-980403-4.i386.rpm \
        dhcpcd-0.70-2.i386.rpm \
        diffutils-2.7-11.i386.rpm \
        ed-0.2-8.i386.rpm \
        eject-1.5-4.i386.rpm \
        etcskel-1.3-6.noarch.rpm \
        file-3.25-2.i386.rpm \
        findutils-4.1-25.i386.rpm \
        gawk-3.0.3-3.i386.rpm \
        gd-1.3-3.i386.rpm \
        gdbm-1.7.3-17.i386.rpm \
        getty_ps-2.0.7j-4.i386.rpm \
        glib-1.0.6-3.i386.rpm \
        gpm-1.13-8.i386.rpm \
        groff-1.11a-6.i386.rpm \
        gzip-1.2.4-12.i386.rpm \
        hdparm-3.3-2.i386.rpm \
        initscripts-3.78-1.i386.rpm \
        isapnptools-1.15a-3.i386.rpm \
        kbd-0.96a-8.i386.rpm \
        kbdconfig-1.8.3-1.i386.rpm \
        kernel-2.0.36-0.7.i386.rpm \
        kernel-pcmcia-cs-2.0.36-0.7.i386.rpm \
        ld.so-1.9.5-8.i386.rpm \
        less-332-2.i386.rpm \
        libc-5.3.12-27.i386.rpm \
        libg++-2.7.2.8-9.i386.rpm \
        libstdc++-2.8.0-14.i386.rpm \
        lilo-0.20-2.i386.rpm \
        pwdb-0.55-1.i386.rpm \
        sed-3.02-1.i386.rpm \
        pamconfig-0.51-5.noarch.rpm \
        pam-0.64-3.i386.rpm \
        sh-utils-1.16-14.i386.rpm \
        textutils-1.22-7.i386.rpm \
        logrotate-2.6-3.i386.rpm \
        losetup-2.8a-2.i386.rpm \
        mailcap-1.0-9.noarch.rpm \
        mailx-8.1.1-5.i386.rpm \
        man-1.5f-1.i386.rpm \
        mingetty-0.9.4-8.i386.rpm \
        mkbootdisk-1.1-2.i386.rpm \
        mkinitrd-1.8-3.i386.rpm \
        modutils-2.1.85-9.i386.rpm \
        mount-2.8a-2.i386.rpm \
        mouseconfig-3.1.3-1.i386.rpm \
        mt-st-0.5-1.i386.rpm \
        ncompress-4.2.4-11.i386.rpm \
        net-tools-1.46-1.i386.rpm \
        newt-0.30-2.i386.rpm \
        ntsysv-0.9.6-1.i386.rpm \
        passwd-0.50-11.i386.rpm \
        perl-5.004m4-1.i386.rpm \
        procmail-3.10-13.i386.rpm \
        procps-1.2.9-2.i386.rpm \
        psmisc-17-3.i386.rpm \
        python-1.5.1-5.i386.rpm \
        pythonlib-1.22-2.noarch.rpm \
        quota-1.55-9.i386.rpm \
        readline-2.2.1-1.i386.rpm \
        redhat-release-5.2-1.noarch.rpm \
        rhs-hwdiag-0.30-1.i386.rpm \
        rootfiles-5.2-2.noarch.rpm \
        rpm-2.5.5-5.2.i386.rpm \
        sash-2.1-1.i386.rpm \
        setconsole-1.0-5.noarch.rpm \
        setserial-2.14-4.i386.rpm \
        setuptool-1.0-1.noarch.rpm \
        slang-0.99.38-8.i386.rpm \
        stat-1.5-8.i386.rpm \
        sysklogd-1.3-25.i386.rpm \
        SysVinit-2.74-5.i386.rpm \
        tar-1.12-4.i386.rpm \
        tcsh-6.07.09-1.i386.rpm \
        time-1.7-6.i386.rpm \
        timeconfig-2.5-1.i386.rpm \
        tmpwatch-1.5.1-2.i386.rpm \
        util-linux-2.8-11.i386.rpm \
        vim-common-5.3-3.i386.rpm \
        vim-minimal-5.3-3.i386.rpm \
        vixie-cron-3.0.1-26.i386.rpm \
        which-1.0-8.i386.rpm \
        words-2-11.noarch.rpm && \
    rpm --verbose --root "${__BUILD_DIR__}/" --install --ignorearch --noorder --noscripts --notriggers \
        MAKEDEV-2.3.1-7.noarch.rpm \
        gecko-1.6-0.i386.rpm \
        linuxconf-1.12r5-6rh.i386.rpm \
        sendmail-8.8.7-20.i386.rpm && \
    rm -rf "${__BUILD_DIR__}/"/dev

# Third stage of Dockerfile
FROM scratch

ARG __BUILD_DIR__="/build"

COPY --from=1 "${__BUILD_DIR__}" "/"

ENV \
    LANG="C.UTF-8" \
    LC_ALL="C.UTF-8"

LABEL \
    org.opencontainers.image.source="https://github.com/uyjulian/rhl_5_2_container" \
    maintainer="Julian Uy <https://uyjulian.github.io/>" \
    vendor="uyjulian" \
    cmd="docker container run --interactive --rm --tty ghcr.io/uyjulian/rhl_5_2_container:latest" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.name="ghcr.io/uyjulian/rhl_5_2_container" \
    org.label-schema.description="Red Hat Linux 5.2 Container" \
    org.label-schema.url="https://uyjulian.github.io/" \
    org.label-schema.vcs-url="https://github.com/uyjulian/rhl_5_2_container" \
    org.label-schema.vendor="uyjulian" \
    org.label-schema.version="5.2" \
    org.label-schema.docker.cmd="docker container run --interactive --rm --tty ghcr.io/uyjulian/rhl_5_2_container:latest" \
    org.label-schema.docker.cmd.test="docker container run --interactive --rm --tty ghcr.io/uyjulian/rhl_5_2_container:latest /bin/true"

CMD ["/bin/bash"]
