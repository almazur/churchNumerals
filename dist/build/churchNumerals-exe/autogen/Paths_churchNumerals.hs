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

bindir     = "C:\\Users\\Ola\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\Ola\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.2.1\\churchNumerals-0.1.0.0-4PtX5Szs0dUFrkBbdQoATg-churchNumerals-exe"
dynlibdir  = "C:\\Users\\Ola\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.2.1"
datadir    = "C:\\Users\\Ola\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.2.1\\churchNumerals-0.1.0.0"
libexecdir = "C:\\Users\\Ola\\AppData\\Roaming\\cabal\\churchNumerals-0.1.0.0-4PtX5Szs0dUFrkBbdQoATg-churchNumerals-exe\\x86_64-windows-ghc-8.2.1\\churchNumerals-0.1.0.0"
sysconfdir = "C:\\Users\\Ola\\AppData\\Roaming\\cabal\\etc"

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
