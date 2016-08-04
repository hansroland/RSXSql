-- ---------------------------------------------------------
-- Module ConnectionString
-- ---------------------------------------------------------

{-# LANGUAGE OverloadedStrings          #-}

module ConnectionString where

import Data.ByteString

-- | Return the connection string to connect to the PostgresDB
connectionString :: IO ByteString
connectionString =
   return "host=localhost dbname=testdb user=roland password=********* port=5432"
