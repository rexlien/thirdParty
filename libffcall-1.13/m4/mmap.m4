dnl -*- Autoconf -*-
dnl Copyright (C) 1993-2017 Free Software Foundation, Inc.
dnl This file is free software, distributed under the terms of the GNU
dnl General Public License as published by the Free Software Foundation;
dnl either version 2 of the License, or (at your option) any later version.
dnl As a special exception to the GNU General Public License, this file
dnl may be distributed as part of a program that contains a configuration
dnl script generated by Autoconf, under the same distribution terms as
dnl the rest of that program.

dnl From Bruno Haible, Marcus Daniels, Sam Steingold.

AC_PREREQ([2.57])

AC_DEFUN([FFCALL_MMAP],
[
  AC_CHECK_HEADER([sys/mman.h], [], [no_mmap=1])
  if test -z "$no_mmap"; then
    AC_CHECK_FUNC([mmap], [], [no_mmap=1])
    if test -z "$no_mmap"; then
      AC_DEFINE([HAVE_MMAP], [], [have <sys/mmap.h> and the mmap() function])
      AC_CACHE_CHECK([for working mmap], [ffcall_cv_func_mmap_works],
        [mmap_prog_1='
           #include <stdlib.h>
           #ifdef HAVE_UNISTD_H
            #include <unistd.h>
           #endif
           #include <fcntl.h>
           #include <sys/types.h>
           #include <sys/mman.h>
           int main ()
           {
         '
         mmap_prog_2='
             if (mmap(NULL,0x100000,PROT_READ|PROT_WRITE,flags,fd,0) == (void*)-1)
               exit(1);
             exit(0);
           }
         '
         AC_TRY_RUN(GL_NOCRASH
           [$mmap_prog_1
            int flags = MAP_ANON | MAP_PRIVATE;
            int fd = -1;
            nocrash_init();
            $mmap_prog_2
           ],
           [have_mmap_anon=1
            ffcall_cv_func_mmap_anon=yes],
           [],
           [dnl When cross-compiling, don't assume anything.
            :
           ])
         AC_TRY_RUN(GL_NOCRASH
           [$mmap_prog_1
            int flags = MAP_ANONYMOUS | MAP_PRIVATE;
            int fd = -1;
            nocrash_init();
            $mmap_prog_2
           ],
           [have_mmap_anon=1
            ffcall_cv_func_mmap_anonymous=yes],
           [],
           [dnl When cross-compiling, don't assume anything.
            :
           ])
         AC_TRY_RUN(GL_NOCRASH
           [$mmap_prog_1
            #ifndef MAP_FILE
             #define MAP_FILE 0
            #endif
            int flags = MAP_FILE | MAP_PRIVATE;
            int fd = open("/dev/zero",O_RDONLY,0666);
            if (fd<0)
              exit(1);
            nocrash_init();
            $mmap_prog_2
           ],
           [have_mmap_devzero=1
            ffcall_cv_func_mmap_devzero=yes],
           [],
           [dnl When cross-compiling, don't assume anything.
            :
           ])
         if test -n "$have_mmap_anon" -o -n "$have_mmap_devzero"; then
           ffcall_cv_func_mmap_works=yes
         else
           ffcall_cv_func_mmap_works=no
         fi
        ])
      if test "$ffcall_cv_func_mmap_anon" = yes; then
        AC_DEFINE([HAVE_MMAP_ANON], [],
          [<sys/mman.h> defines MAP_ANON and mmaping with MAP_ANON works])
      fi
      if test "$ffcall_cv_func_mmap_anonymous" = yes; then
        AC_DEFINE([HAVE_MMAP_ANONYMOUS], [],
          [<sys/mman.h> defines MAP_ANONYMOUS and mmaping with MAP_ANONYMOUS works])
      fi
      if test "$ffcall_cv_func_mmap_devzero" = yes; then
        AC_DEFINE([HAVE_MMAP_DEVZERO], [],
          [mmaping of the special device /dev/zero works])
      fi
    fi
  fi
])