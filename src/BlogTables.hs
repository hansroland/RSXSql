-- -------------------------------------------------------------------
-- Define database tables for PostgreSQL
-- -------------------------------------------------------------------

{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-} 
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}

module BlogTables where

import Database.Persist.TH

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
-- | Record for the Person table
Person
    name String
    age Int Maybe
    deriving Show
-- | Record for the blog_post table
BlogPost
    title String
    authorId PersonId
    deriving Show
|]

