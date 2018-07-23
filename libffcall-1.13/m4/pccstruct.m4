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

AC_PREREQ([2.13])

AC_DEFUN([PCCSR_DOC],[for pcc non-reentrant struct return convention])
AC_DEFUN([FFCALL_PCC_STRUCT_RETURN],
[
  AC_CACHE_CHECK([PCCSR_DOC], [ffcall_cv_c_struct_return_static],
    [save_CFLAGS="$CFLAGS"
     if test $CC_GCC = true; then
       CFLAGS="$CFLAGS -O0"
     fi
     AC_TRY_RUN(GL_NOCRASH
       [typedef struct { int a; int b; int c; int d; int e; } foo;
        foo foofun () { static foo foopi = {3141,5926,5358,9793,2385}; return foopi; }
        foo* (*fun) () = (foo* (*) ()) foofun;
        int main()
        { nocrash_init();
         {foo foo1;
          foo* fooptr1;
          foo foo2;
          foo* fooptr2;
          foo1 = foofun(); fooptr1 = (*fun)(&foo1);
          foo2 = foofun(); fooptr2 = (*fun)(&foo2);
          return !(fooptr1 == fooptr2 && fooptr1->c == 5358);
        }}
       ],
       [ffcall_cv_c_struct_return_static=yes],
       [ffcall_cv_c_struct_return_static=no],
       [dnl When cross-compiling, don't assume anything.
        dnl There are even weirder return value passing conventions than pcc.
        ffcall_cv_c_struct_return_static="guessing no"
       ])
     CFLAGS="$save_CFLAGS"
    ])
  case "$ffcall_cv_c_struct_return_static" in
    *yes) AC_DEFINE([__PCC_STRUCT_RETURN__], [], PCCSR_DOC) ;;
    *no) ;;
  esac
])