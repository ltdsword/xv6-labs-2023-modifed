.text

	/*
         * save the old thread's registers,
         * restore the new thread's registers.
         */

	.globl thread_switch
thread_switch:
	/* YOUR CODE HERE */

    /*
    We have a0 holds the memory address of the old thread's struct context.
    And a1 holds the memory address of the new thread's struct context.
    Since every register in 64-bit RISC-V is 8 bytes long, we use sd (store double-word) 
    to save to memory, and ld (load double-word) to read from memory, moving exactly 8 bytes (0, 8, 16, 24...) 
    for each register based on the exact order we defined struct context.
    */
	
	/* STEP 1: Save the old thread's registers into the address at a0 */
	sd ra, 0(a0)
	sd sp, 8(a0)
	sd s0, 16(a0)
	sd s1, 24(a0)
	sd s2, 32(a0)
	sd s3, 40(a0)
	sd s4, 48(a0)
	sd s5, 56(a0)
	sd s6, 64(a0)
	sd s7, 72(a0)
	sd s8, 80(a0)
	sd s9, 88(a0)
	sd s10, 96(a0)
	sd s11, 104(a0)

	/* STEP 2: Restore the new thread's registers from the address at a1 */
	ld ra, 0(a1)
	ld sp, 8(a1)
	ld s0, 16(a1)
	ld s1, 24(a1)
	ld s2, 32(a1)
	ld s3, 40(a1)
	ld s4, 48(a1)
	ld s5, 56(a1)
	ld s6, 64(a1)
	ld s7, 72(a1)
	ld s8, 80(a1)
	ld s9, 88(a1)
	ld s10, 96(a1)
	ld s11, 104(a1)

	/* STEP 3: Return to the newly loaded return address (ra) */
	ret    /* return to ra */