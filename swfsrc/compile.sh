# путь до каталога с Flex SDK
sdk='/opt/flex_sdk_4.6/'
# путь до компилятора mxmlc
mxmlc=$sdk'bin/mxmlc'
 
# запуск компилятора
"$mxmlc" ./src/Main.as -output ../public/bot.swf