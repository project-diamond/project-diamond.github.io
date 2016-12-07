module Config where

import Hakyll

frontPageNewsItems :: Int
frontPageNewsItems = 10

feedNewsItems :: Int
feedNewsItems = 42

feedConfig :: FeedConfiguration
feedConfig =
  FeedConfiguration { feedTitle       = "Project Diamond"
                    , feedDescription = "Digital Alternatives to Monetary Denominations"
                    , feedAuthorName  = "Project Diamond"
                    , feedAuthorEmail = "crypto-diamond@googlegroups.com"
                    , feedRoot        = "https://project-diamond.github.io"
                    }
