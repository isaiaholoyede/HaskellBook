# Intermission: Check your understanding

```haskell
import qualified Control.Concurrent as CC
import qualified Control.Concurrent.MVar as MV
import qualified Data.ByteString.Char8 as B
import qualified Data.Locator as DL
import qualified Data.Time.Clock.POSIX as PSX
import qualified Filesystem as FS
import qualified Filesystem.Path.CurrentOS as FPC
import qualified Network.Info as NI
import qualified Safe
import Control.Exception (mask, try)
import Control.Monad (forever, when)
import Data.Bits
import Data.Bits.Bitwise (fromListBE)
import Data.List.Split (chunksOf)
import Database.Blacktip.Types
import System.IO.Unsafe (unsafePerformIO)

```

1. Functions that are being imported from Control.Monad:
    - forever
    - when
2. Imports that are both unqualified and imported in their entirety:
    - Data.Bits
    - Database.Blacktip.Types
3. Blacktip's Type modules supposedly brings in datatypes defined for the blacktips library

```haskell

writeTimestamp :: MV.MVar ServerState
               -> FPC.FilePath
               -> IO CC.ThreadId
writeTimestamp s path = do
  CC.forkIO go
  where go = forever $ do
         ss <- MV.readMVar s
         mask $ \_ -> do
           FS.writeFile path
           (B.pack (show (ssTime ss)))
         -- sleep for 1 second
         CC.threadDelay 1000000
```

a. The type signature refers to three aliased imports. The modules named in those aliases are:
    - Control.Concurrent.MVar
    - Filesystem.Path.CurrentOS
    - Control.Concurrent
b. `FS.writeFile` refers to `Filesystem` import.
c. `forever` comes from `Control.Monad` import.
