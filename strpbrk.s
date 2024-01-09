	.syntax unified
	.cpu cortex-m3
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 18, 4
	.thumb
	.file	"strpbrk.c"
	.text
	.align	1
	.global	strpbrk
	.thumb
	.thumb_func
	.type	strpbrk, %function
strpbrk:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldrb	r3, [r0, #0]	@ zero_extendqisi2
	cbnz	r3, .L2
	mov	r0, r3
	pop	{r4, pc}
.L5:
	cmp	r2, r4
	beq	.L4
	adds	r3, r3, #1
.L7:
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	cmp	r4, #0
	bne	.L5
	b	.L13
.L2:
	mov	r3, r1
.L8:
	ldrb	r2, [r0, #0]	@ zero_extendqisi2
	cbz	r2, .L4
	mov	r3, r1
	b	.L7
.L4:
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	it	eq
	moveq	r0, #0
	pop	{r4, pc}
.L13:
	adds	r0, r0, #1
	b	.L8
	.size	strpbrk, .-strpbrk
	.ident	"GCC: (Sourcery G++ Lite 2010q1-188) 4.4.1"
