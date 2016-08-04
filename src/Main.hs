--  See www.yesodweb.com/book/persistent


{-# LANGUAGE OverloadedStrings          #-}


import           Database.Persist
import           Database.Persist.Postgresql

import           Control.Monad.IO.Class  (liftIO)
import           Control.Monad.Logger    (runStderrLoggingT)

import ConnectionString
import BlogTables as Table

main :: IO ()
main = do
    connStr <- connectionString
    runStderrLoggingT $ withPostgresqlPool connStr 10 $ liftSqlPersistMPool $ do
      runMigration migrateAll

      johnId <- insert $ Table.Person "John Doe" $ Just 35
      janeId <- insert $ Table.Person "Jane Doe" Nothing

      insert $ Table.BlogPost "My first post" johnId
      insert $ Table.BlogPost "One more for good measure" johnId

      oneJohnPost <- selectList [Table.BlogPostAuthorId ==. johnId] [LimitTo 1]
      liftIO $ print (oneJohnPost :: [Entity Table.BlogPost])

      john <- get johnId
      liftIO $ print (john :: Maybe Table.Person)

    -- delete janeId
    -- deleteWhere [Table.BlogPostAuthorId ==. johnId]


