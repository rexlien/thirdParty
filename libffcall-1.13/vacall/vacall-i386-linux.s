	.file	"vacall-i386.c"
	.text
	.align 2
	.p2align 2,,3
.globl __vacall
	.type	__vacall,@function
__vacall:
	pushl	%ebp
	movl	%esp, %ebp
	leal	8(%ebp), %edx
	pushl	%esi
	subl	$64, %esp
	movl	%edx, -52(%ebp)
	leal	-56(%ebp), %edx
	movl	$0, -56(%ebp)
	movl	$0, -48(%ebp)
	movl	$0, -44(%ebp)
	movl	%ebx, -24(%ebp)
	pushl	%edx
	call	*vacall_function
	movl	-44(%ebp), %ecx
	addl	$16, %esp
	testl	%ecx, %ecx
	je	.L46
	cmpl	$1, %ecx
	je	.L48
	cmpl	$2, %ecx
	je	.L48
	cmpl	$3, %ecx
	je	.L53
	cmpl	$4, %ecx
	je	.L54
	cmpl	$5, %ecx
	je	.L55
	cmpl	$6, %ecx
	je	.L52
	cmpl	$7, %ecx
	je	.L52
	cmpl	$8, %ecx
	je	.L52
	cmpl	$9, %ecx
	je	.L52
	leal	-10(%ecx), %edx
	cmpl	$1, %edx
	ja	.L22
	movl	-32(%ebp), %eax
#APP
	movl -28(%ebp),%edx
.L35:
	.p2align 2,,3
#NO_APP
.L46:
	movl	-56(%ebp), %ecx
.L3:
	andl	$512, %ecx
	je	.L1
#APP
	movl 0(%ebp),%ecx
#NO_APP
	movl	-52(%ebp), %esp
#APP
	jmp *%ecx
#NO_APP
.L1:
	movl	-4(%ebp), %esi
	leave
	ret
.L22:
	cmpl	$12, %ecx
	je	.L56
	cmpl	$13, %ecx
	je	.L57
	cmpl	$14, %ecx
	je	.L52
	cmpl	$15, %ecx
	jne	.L46
	movl	-56(%ebp), %ecx
	testl	$1, %ecx
	movl	%ecx, %esi
	jne	.L47
	testl	$1024, %ecx
	je	.L33
	movl	-40(%ebp), %edx
	cmpl	$1, %edx
	je	.L58
	cmpl	$2, %edx
	je	.L59
	cmpl	$4, %edx
	je	.L60
	cmpl	$8, %edx
	je	.L61
.L33:
	testl	$24, %esi
	jne	.L42
#APP
	leal -4(%ebp), %esp
	popl %esi
	leave
	ret $4
#NO_APP
.L42:
	andl	$16, %esi
	je	.L3
.L47:
	movl	-48(%ebp), %eax
	jmp	.L3
.L61:
	movl	-48(%ebp), %edx
	movl	(%edx), %eax
#APP
	movl 4(%edx),%edx
#NO_APP
	jmp	.L3
.L60:
	movl	-48(%ebp), %edx
	movl	(%edx), %eax
	jmp	.L3
	.p2align 2,,3
.L59:
	movl	-48(%ebp), %edx
	movzwl	(%edx), %eax
	jmp	.L3
.L58:
	movl	-48(%ebp), %edx
	movzbl	(%edx), %eax
	jmp	.L3
	.p2align 2,,3
.L52:
	movl	-32(%ebp), %eax
	jmp	.L46
.L57:
#APP
	fldl -32(%ebp)
#NO_APP
	jmp	.L46
.L56:
#APP
	flds -32(%ebp)
#NO_APP
	jmp	.L46
	.p2align 2,,3
.L55:
	movzwl	-32(%ebp), %eax
	jmp	.L46
.L54:
	movswl	-32(%ebp),%eax
	jmp	.L46
.L53:
	movzbl	-32(%ebp), %eax
	jmp	.L46
	.p2align 2,,3
.L48:
	movsbl	-32(%ebp),%eax
	jmp	.L46
.Lfe1:
	.size	__vacall,.Lfe1-__vacall
	.ident	"GCC: (GNU) 3.1"
