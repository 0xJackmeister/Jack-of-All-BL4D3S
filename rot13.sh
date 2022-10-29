#/bin/bash

#Usage : Use it with pipeline or run the file and parse the hash

echo "\n"
echo "ASCII  A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z"
echo "ROT13  N O P Q R S T U V W X Y Z A B C D E F G H I J K L M n o p q r s t u v w x y z a b c d e f g h i j k l m"
echo "\n"

echo -n "Hash : "
tr '[a-z][A-Z]' '[n-za-m][N-ZA-M]'


