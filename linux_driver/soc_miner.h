#ifndef __SOC_MINER_H__
#define __SOC_MINER_H__

int32_t socStartup         (int32_t   asicId,
                                   void        * param, uint32_t paramLen, void * (*defaults)(uint32_t, uint32_t));
int32_t socStop            (int32_t asicId);
int32_t socReset           (int32_t asicId,
                                   uint32_t int_on_off );

int32_t socReadRegister8   (int32_t asicId,
                                   uint32_t address, uint32_t nreg, uint8_t * value);
int32_t socReadRegister16  (int32_t asicId,
                                   uint32_t address, uint32_t nreg, uint16_t * value);
int32_t socReadRegister32  (int32_t asicId,
                                   uint32_t address, uint32_t nreg, uint32_t * value);

int32_t socWriteRegister8  (int32_t asicId,
                                   uint32_t address, uint32_t nreg, uint8_t * value);
int32_t socWriteRegister16 (int32_t asicId,
                                   uint32_t address, uint32_t nreg, uint16_t * value);
int32_t socWriteRegister32 (int32_t asicId,
                                   uint32_t address, uint32_t nreg, uint32_t * value);

int32_t socReadMemory      (int32_t asicId,
                                   uint32_t address, uint32_t nbyte, uint8_t * value);
int32_t socWriteMemory     (int32_t asicId,
                                   uint32_t address, uint32_t nbyte, uint8_t * value);
int32_t socClearMemory     (int32_t asicId,
                                   uint32_t address, uint32_t nbyte);

int32_t socDmaRead         (int32_t asicId,
                                   uint32_t address, uint32_t nbyte, uint8_t * value, uint32_t endian);
int32_t socDmaWrite        (int32_t asicId,
                                   uint32_t address, uint32_t nbyte, uint8_t * value, uint32_t endian);

int32_t socIsrRegister     (int32_t asicId,
                                   uint32_t inum, uint32_t ipl, void (*handler)(void*, uint32_t), void * param);
int32_t socIsrUnregister   (int32_t asicId,
                                   uint32_t inum);

int32_t socInterruptEnable (int32_t asicId,
                                   uint32_t inum);
int32_t socInterruptDisable(int32_t asicId,
                                   uint32_t inum);

int32_t socInterruptPrepare(int32_t asicId,
                                   uint32_t inum, uint32_t reg, uint32_t value);
int32_t socInterruptWait   (int32_t asicId,
                                   uint32_t inum, uint32_t timeout);
int32_t socInterruptCancel (int32_t asicId,
                                   uint32_t inum);

#if 0
int32_t socMessage         (int32_t asicId,
                                   uint32_t type, uint32_t id, uint8_t *address, uint32_t *nbyte);

int32_t socSetAttribute    (int32_t          asicId,
                                   int32_t   attribute,
                                   uint32_t             value);

int32_t socGetAttribute    (int32_t          asicId,
                                   int32_t   attribute,
                                   uint32_t           * result);

int32_t socGetParameter    (int32_t          asicId,
                                   AtlasAsicParameter   parameter,
                                   uint32_t           * result);

int32_t socStatistics      (int32_t asicId,
                                   uint32_t command, int32_t function, void *data, uint32_t *datalen);
#endif

#endif //#__SOC_MINER_H__
