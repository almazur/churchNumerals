{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_churchNumerals (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Ola\\churchNumerals\\.stack-work\\install\\ccbce92a\\bin"
libdir     = "C:\\Users\\Ola\\churchNumerals\\.stack-work\\install\\ccbce92a\\lib\\x86_64-windows-ghc-8.2.2\\churchNumerals-0.1.0.0-1sK2SaFaibCJi4Uaa2jpxM-churchNumerals-test"
dynlibdir  = "C:\\Users\\Ola\\churchNumerals\\.stack-work\\install\\ccbce92a\\lib\\x86_64-windows-ghc-8.2.2"
datadir    = "C:\\Users\\Ola\\churchNumerals\\.stack-work\\install\\ccbce92a\\share\\x86_64-windows-ghc-8.2.2\\churchNumerals-0.1.0.0"
libexecdir = "C:\\Users\\Ola\\churchNumerals\\.stack-work\\install\\ccbce92a\\libexec\\x86_64-windows-ghc-8.2.2\\churchNumerals-0.1.0.0"
sysconfdir = "C:\\Users\\Ola\\churchNumerals\\.stack-work\\install\\ccbce92a\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "churchNumerals_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "churchNumerals_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "churchNumerals_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "churchNumerals_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "churchNumerals_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "churchNumerals_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)