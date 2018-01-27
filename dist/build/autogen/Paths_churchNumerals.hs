module Paths_churchNumerals (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/mateusz/.cabal/bin"
libdir     = "/home/mateusz/.cabal/lib/x86_64-linux-ghc-7.10.3/churchNumerals-0.1.0.0-7ggsG6llUKd2OTmwOQvegj"
datadir    = "/home/mateusz/.cabal/share/x86_64-linux-ghc-7.10.3/churchNumerals-0.1.0.0"
libexecdir = "/home/mateusz/.cabal/libexec"
sysconfdir = "/home/mateusz/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "churchNumerals_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "churchNumerals_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "churchNumerals_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "churchNumerals_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "churchNumerals_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
