module FOMObot.Types.Message where

import Data.Aeson (FromJSON, parseJSON, (.:), Value(..))
import Data.Aeson.Types (typeMismatch)

data Message = Message
    { _type :: String
    , _channel :: String
    , _ts :: String
    } deriving (Show)

instance FromJSON Message where
    parseJSON (Object o) = Message
        <$> o .: "type"
        <*> o .: "channel"
        <*> o .: "ts"

    parseJSON invalid = typeMismatch "Message" invalid

