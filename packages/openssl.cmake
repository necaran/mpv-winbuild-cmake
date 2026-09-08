ExternalProject_Add(openssl
    GIT_REPOSITORY https://github.com/openssl/openssl.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--sparse --filter=tree:0"
    GIT_CLONE_POST_COMMAND "sparse-checkout set --no-cone /* !test"
    GIT_REMOTE_NAME origin
    GIT_RESET f089acdf4bc7ba94a79f4bf6eb7362c3e7d14aa9
    GIT_SUBMODULES ""
    UPDATE_COMMAND ""
    PATCH_COMMAND ${EXEC} git am --3way ${CMAKE_CURRENT_SOURCE_DIR}/openssl-*.patch
    CONFIGURE_COMMAND ${EXEC} mkdir -p apps/include
    COMMAND ${EXEC} CONF=1 <SOURCE_DIR>/Configure
        --cross-compile-prefix=${TARGET_ARCH}-
        --prefix=${MINGW_INSTALL_PREFIX}
        --libdir=lib
        --release
        no-autoload-config
        ${openssl_target}
        ${openssl_ec_opt}
        no-ssl3-method
        no-whirlpool
        no-filenames
        no-camellia
        no-capieng
        no-shared
        no-rmd160
        no-module
        no-legacy
        no-tests
        threads
        no-docs
        no-apps
        no-ocsp
        no-ssl3
        no-cmac
        no-mdc2
        no-idea
        no-cast
        no-seed
        no-aria
        no-err
        no-dso
        no-dsa
        no-srp
        no-rc2
        no-rc4
        no-sm2
        no-sm3
        no-sm4
        no-md4
        no-cms
        no-cmp
        no-dh
        no-bf
        no-tls1
        no-tls1_1
        no-deprecated
        no-autoerrinit
        no-ct
        no-dgram
        no-gost
        no-http
        no-nextprotoneg
        no-posix-io
        no-rdrand
        no-rfc3779
        no-srtp
        no-ssl-trace
        no-ts
        no-uplink
        no-integrity-only-ciphers
        no-blake2
        no-des
        no-ec2m
        no-hmac-drbg-kdf
        no-kbkdf
        no-krb5kdf
        no-ml-dsa
        no-ocb
        no-pvkkdf
        no-scrypt
        no-siphash
        no-siv
        no-slh-dsa
        no-snmpkdf
        no-srtpkdf
        no-sshkdf
        no-sskdf
        no-x942kdf
        no-x963kdf
    BUILD_COMMAND ${MAKE} build_sw
    INSTALL_COMMAND ${MAKE} install_sw
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(openssl)
cleanup(openssl install)
