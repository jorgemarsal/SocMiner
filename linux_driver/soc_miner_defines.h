#define SOC_MINER_MAJOR 234U
#define SOC_MINER_MINOR 0
#define SOC_DEVICE_MAJOR 234U
#define SOC_DEVICE_MINOR 0

#define PARAMETER_LEN      (100*4)

#define SOC_DECLARE             _IOWR( SOC_DEVICE_MAJOR, DECLARE,             IoctlArgument)
#define SOC_STARTUP             _IOW(  SOC_DEVICE_MAJOR, STARTUP,             IoctlArgument)
#define SOC_STOP                _IOW(  SOC_DEVICE_MAJOR, STOP,                IoctlArgument)
#define SOC_READ_REGISTER8      _IOWR( SOC_DEVICE_MAJOR, READ_REGISTER8,      IoctlArgument)
#define SOC_READ_REGISTER16     _IOWR( SOC_DEVICE_MAJOR, READ_REGISTER16,     IoctlArgument)
#define SOC_READ_REGISTER32     _IOWR( SOC_DEVICE_MAJOR, READ_REGISTER32,     IoctlArgument)
#define SOC_WRITE_REGISTER8     _IOW(  SOC_DEVICE_MAJOR, WRITE_REGISTER8,     IoctlArgument)
#define SOC_WRITE_REGISTER16    _IOW(  SOC_DEVICE_MAJOR, WRITE_REGISTER16,    IoctlArgument)
#define SOC_WRITE_REGISTER32    _IOW(  SOC_DEVICE_MAJOR, WRITE_REGISTER32,    IoctlArgument)
#define SOC_READ_MEMORY         _IOWR( SOC_DEVICE_MAJOR, READ_MEMORY,         IoctlArgument)
#define SOC_WRITE_MEMORY        _IOW(  SOC_DEVICE_MAJOR, WRITE_MEMORY,        IoctlArgument)
#define SOC_DMA_READ            _IOWR( SOC_DEVICE_MAJOR, DMA_READ,            IoctlArgument)
#define SOC_DMA_WRITE           _IOW(  SOC_DEVICE_MAJOR, DMA_WRITE,           IoctlArgument)
#define SOC_INTERRUPT_PREPARE   _IOW(  SOC_DEVICE_MAJOR, INTERRUPT_PREPARE,   IoctlArgument)
#define SOC_INTERRUPT_WAIT      _IOW(  SOC_DEVICE_MAJOR, INTERRUPT_WAIT,      IoctlArgument)
#define SOC_INTERRUPT_CANCEL    _IOW(  SOC_DEVICE_MAJOR, INTERRUPT_CANCEL,    IoctlArgument)
#define SOC_FILL_MEMORY         _IOW(  SOC_DEVICE_MAJOR, FILL_MEMORY,         IoctlArgument)
#define SOC_READ_REGISTER_SET   _IOWR( SOC_DEVICE_MAJOR, READ_REGISTER_SET,   IoctlArgument)
#define SOC_WRITE_REGISTER_SET  _IOW(  SOC_DEVICE_MAJOR, WRITE_REGISTER_SET,  IoctlArgument)
#define SOC_DMA_READ_TO_ASIC    _IOWR( SOC_DEVICE_MAJOR, DMA_READ_TO_ASIC,    IoctlArgument)
#define SOC_DMA_WRITE_FROM_ASIC _IOW(  SOC_DEVICE_MAJOR, DMA_WRITE_FROM_ASIC, IoctlArgument)
#define SOC_MESSAGE             _IOW(  SOC_DEVICE_MAJOR, MESSAGE,             IoctlArgument)
#define SOC_STATISTICS          _IOW(  SOC_DEVICE_MAJOR, STATISTICS,          IoctlArgument)
#define SOC_GET_PARAMETER       _IOW(  SOC_DEVICE_MAJOR, GET_PARAMETER,       IoctlArgument)
#define SOC_RESET               _IOW(  SOC_DEVICE_MAJOR, RESET,               IoctlArgument)
#define SOC_MULTIPE_DMA_WRITE   _IOW(  SOC_DEVICE_MAJOR, MULTIPLE_DMA_WRITE,  IoctlArgument)

typedef struct
{
    int32_t  par;        ///< command parameter (usally ASIC identifier).
    //uint64_t data;       ///< data pointer
    uint32_t data;//for 32-bit systems
    int32_t  datalen;    ///< data length.
} IoctlArgument;

/** structure to exchange blocks between user-kernel.
 */
typedef struct
{
    //uint64_t value;    ///< data source/destination.
    uint32_t value;//for 32-bit system
    uint32_t address;  ///< data address.
    uint32_t count;    ///< number of bytes.
    uint32_t endian;   ///< endian bytes;
} TransferBlock;

typedef struct
{
    uint32_t  address;  ///< data address.
    uint32_t  count;    ///< number of bytes.
    uint32_t  asicId;   ///< asic source/destination.
    uint32_t  asicAddr; ///< data source/destination.
    uint32_t  endian;   ///< endian bytes;
} TransferAsicBlock;

/** structure for interrupWait call.
 */
typedef struct
{
    uint32_t inum;
    uint32_t reg;
    uint32_t value;
    uint32_t timeout;
} WaitBlock;

/** structure to exchange fill-memory blocks between user-kernel.
 */
typedef struct
{
    uint32_t address;   ///< data address.
    uint32_t count;     ///< pattern count.
    uint32_t pattern;   ///< pattern value.
} FillBlock;

/** structure to manage driver message
 */

typedef struct
{
    uint64_t address;  ///< data address.
    uint32_t type;     ///< message funtion.
    uint32_t id;       ///< message id.
    uint32_t count;    ///< number of bytes.
} Message;

/** structure to manage driver statistics
 */

typedef struct
{
    uint64_t data;
    uint64_t datalen;
    uint32_t command;
    int32_t  function;
} Statistics;

/**
 * Structure to get AtlasAsic parameters.
 */
typedef struct
{
    uint64_t resultAddress;
    uint32_t parameter;
} ParameterBlock;

/*------------  Supported ioctl command codes for AtlasAsic  ----------------*/

enum IoctlCommands
{
    DECLARE,                // 0
    STARTUP,                // 1
    STOP,                   // 2
    READ_REGISTER8,         // 3
    READ_REGISTER16,        // 4
    READ_REGISTER32,        // 5
    WRITE_REGISTER8,        // 6
    WRITE_REGISTER16,       // 7
    WRITE_REGISTER32,       // 8
    READ_MEMORY,            // 9
    WRITE_MEMORY,           // 10
    DMA_READ,               // 11
    DMA_WRITE,              // 12
    INTERRUPT_PREPARE,      // 13
    INTERRUPT_WAIT,         // 14
    FILL_MEMORY,            // 15
    READ_REGISTER_SET,      // 16
    WRITE_REGISTER_SET,     // 17
    INTERRUPT_ENABLE,       // 18
    INTERRUPT_DISABLE,      // 19
    INTERRUPT_REGISTER,     // 20
    INTERRUPT_UNREGISTER,   // 21
    DMA_READ_TO_ASIC,       // 22
    DMA_WRITE_FROM_ASIC,    // 23
    MESSAGE,                // 24
    STATISTICS,             // 25
    GET_PARAMETER,          // 26
    RESET,                  // 27
    MMAP,                   // 28
    MULTIPLE_DMA_WRITE,     // 29
    INTERRUPT_CANCEL        // 30
};
