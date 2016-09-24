{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_hstest (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
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
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/jacky/Soft/programs/haskell/hstest/.stack-work/install/i386-linux/lts-7.0/8.0.1/bin"
libdir     = "/home/jacky/Soft/programs/haskell/hstest/.stack-work/install/i386-linux/lts-7.0/8.0.1/lib/i386-linux-ghc-8.0.1/hstest-0.1.0.0-AdhbzLPXl4DBYfJor6h9HV"
datadir    = "/home/jacky/Soft/programs/haskell/hstest/.stack-work/install/i386-linux/lts-7.0/8.0.1/share/i386-linux-ghc-8.0.1/hstest-0.1.0.0"
libexecdir = "/home/jacky/Soft/programs/haskell/hstest/.stack-work/install/i386-linux/lts-7.0/8.0.1/libexec"
sysconfdir = "/home/jacky/Soft/programs/haskell/hstest/.stack-work/install/i386-linux/lts-7.0/8.0.1/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hstest_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hstest_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "hstest_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hstest_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hstest_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
