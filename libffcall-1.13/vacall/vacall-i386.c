/* vacall function for i386 CPU */

/*
 * Copyright 1995-2017 Bruno Haible <bruno@clisp.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef REENTRANT
#include "vacall.h.in"
#else /* REENTRANT */
#include "vacall_r.h.in"
#endif

#ifdef REENTRANT
#define __vacall __vacall_r
typedef struct { void (*vacall_function) (void*,va_alist); void* arg; } env_t;
register env_t*	env	__asm__("%ecx");
#endif
register void*	sp	__asm__("%esp");
register void*	sret	__asm__("%ebx");
register int	iret	__asm__("%eax");

#ifdef REENTRANT
static
#endif
void /* the return type is variable, not void! */
__vacall (__vaword firstword)
{
  __va_alist list;
  /* Prepare the va_alist. */
  list.flags = 0;
  list.aptr = (long)&firstword;
  list.raddr = (void*)0;
  list.rtype = __VAvoid;
  list.structraddr = sret;
  /* Call vacall_function. The macros do all the rest. */
#ifndef REENTRANT
  (*vacall_function) (&list);
#else /* REENTRANT */
  (*env->vacall_function) (env->arg,&list);
#endif
  /* Put return value into proper register. */
  if (list.rtype == __VAvoid) {
  } else
  if (list.rtype == __VAchar) {
    iret = list.tmp._char;
  } else
  if (list.rtype == __VAschar) {
    iret = list.tmp._schar;
  } else
  if (list.rtype == __VAuchar) {
    iret = list.tmp._uchar;
  } else
  if (list.rtype == __VAshort) {
    iret = list.tmp._short;
  } else
  if (list.rtype == __VAushort) {
    iret = list.tmp._ushort;
  } else
  if (list.rtype == __VAint) {
    iret = list.tmp._int;
  } else
  if (list.rtype == __VAuint) {
    iret = list.tmp._uint;
  } else
  if (list.rtype == __VAlong) {
    iret = list.tmp._long;
  } else
  if (list.rtype == __VAulong) {
    iret = list.tmp._ulong;
  } else
  if (list.rtype == __VAlonglong || list.rtype == __VAulonglong) {
    /* This code is EXTREMELY fragile!!                     */
    /* It depends on the register allocation chosen by gcc. */
    iret = ((__vaword *) &list.tmp._longlong)[0];
    asm volatile ("movl %0,%%edx" : : "g"(((__vaword *) &list.tmp._longlong)[1]));
  } else
  if (list.rtype == __VAfloat) {
    asm volatile ("flds %0": : "m"(list.tmp._float));
  } else
  if (list.rtype == __VAdouble) {
    asm volatile ("fldl %0": : "m"(list.tmp._double));
  } else
  if (list.rtype == __VAvoidp) {
    iret = (long)list.tmp._ptr;
  } else
  if (list.rtype == __VAstruct) {
    if (list.flags & __VA_PCC_STRUCT_RETURN) {
      /* pcc struct return convention */
      iret = (long) list.raddr;
    } else {
      /* normal struct return convention */
      if (list.flags & __VA_REGISTER_STRUCT_RETURN) {
        if (list.rsize == sizeof(char)) {
          iret = *(unsigned char *) list.raddr;
          goto done;
        } else
        if (list.rsize == sizeof(short)) {
          iret = *(unsigned short *) list.raddr;
          goto done;
        } else
        if (list.rsize == sizeof(int)) {
          iret = *(unsigned int *) list.raddr;
          goto done;
        } else
        if (list.rsize == 2*sizeof(__vaword)) {
          /* This code is EXTREMELY fragile!!                     */
          /* It depends on the register allocation chosen by gcc. */
          iret = ((__vaword *) list.raddr)[0];
          asm volatile ("movl %0,%%edx" : : "g"(((__vaword *) list.raddr)[1]));
          goto done;
        }
      }
      if (!(list.flags & (__VA_NEXTGCC_STRUCT_RETURN | __VA_MSVC_STRUCT_RETURN))) {
        /* We have to pop the struct return address off the stack. */
        /* Callers compiled with -fomit-frame-pointer expect this. */
        /* Return via a "ret $4" instruction. */
        /* NOTE: This is EXTREMELY fragile. We must use the same return sequence
         * as the one generated by GCC, except that we use a "ret $4" instruction
         * in place of the "ret" instruction. Look at the 'pushl' instructions
         * at the beginning of the generated code and at the sequence of
         * instructions right before the generated "ret" instruction. */
#ifdef REENTRANT
        asm volatile ("leal -8(%ebp), %esp");
        asm volatile ("popl %esi");
        asm volatile ("popl %edi");
        asm volatile ("leave");
#else
        asm volatile ("leal -4(%ebp), %esp");
        asm volatile ("popl %esi");
        asm volatile ("leave");
#endif
        asm volatile ("ret $4");
        /*NOTREACHED*/
      }
      if (list.flags & __VA_MSVC_STRUCT_RETURN) {
        /* on MSVC, must put the structure address into %eax */
        iret = (long) list.raddr;
      }
      done: ;
    }
  }
  if (list.flags & __VA_STDCALL_CLEANUP) {
    /* Return, and at the same time pop the arguments off the stack. */
    /* Normally done through a "ret $n" instruction. */
    /* Be careful not to clobber %eax and %edx. Only %ecx can be used. */
    /* Use *__builtin_frame_address(0), since __builtin_return_address(0)
     * is buggy in gcc-2.7.2. */
    asm volatile ("movl %0,%%ecx" : : "g" (*(void**)__builtin_frame_address(0)));
    sp = (void*)list.aptr;
    asm volatile ("jmp *%ecx");
    /*NOTREACHED*/
  }
}

#ifdef REENTRANT
__vacall_r_t
get__vacall_r (void)
{
  return (__vacall_r_t)(void*)&__vacall;
}
#endif
