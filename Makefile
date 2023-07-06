CC=armclang
AS=armclang
LD=armlink

ASFLAGS= -c --target=aarch64-arm-none-eabi
CFLAGS= -c --target=aarch64-arm-none-eabi -I"./include" -O1

# Select build rules based on Windows or Unix
ifdef WINDIR
DONE=@if exist $(1) if exist $(2) echo Build completed.
RM=if exist $(1) del /q $(1)
SHELL=$(WINDIR)\system32\cmd.exe
else
ifdef windir
DONE=@if exist $(1) if exist $(2) echo Build completed.
RM=if exist $(1) del /q $(1)
SHELL=$(windir)\system32\cmd.exe
else
DONE=@if [ -f $(1) ]; then if [ -f $(2) ]; then echo Build completed.; fi; fi
RM=rm -f $(1)
endif
endif

all: linkpack.axf
	$(call DONE,$(EXECUTABLE))

clean:
	$(call RM,*.o)
	$(call RM,linkpack.axf)

linkpack.o: ./src/linkpack.c
	$(CC) ${CFLAGS} ./src/linkpack.c

startup.o: ./asm/startup.s
	$(AS) ${ASFLAGS} ./asm/startup.s

linkpack.axf: startup.o linkpack.o scatter.txt
	$(LD) --scatter=scatter.txt startup.o linkpack.o -o linkpack.axf --entry=start64

run:
	@FVP_Base_RevC-2xAEMvA -a ./linkpack.axf -C bp.secure_memory=false -C cache_state_modelled=0
