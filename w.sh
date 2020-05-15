if [ -z "$1" ]
then
echo "\e[1;31m[!]  Please input the Target Domain:\e[0m";
echo "\e[1;32m[!]  Example:\e[0m" "\e[1;32m sh ll.sh target.com 200 \e[0m";
        exit
fi

echo "";
echo "\e[1;32m[~] Target Url:$1\e[0m";
echo "";

echo "1-content_discovery_all.txt -[373535]"
echo "2-Top10000-RobotsDisallowed.txt-[10000]"
echo "3-Big.txt-[20k]"
echo "4-Parameters.txt -[2.5K] "
echo "5-cgis.txt [1k]"
echo "6-quickhits.txt -[2.5K] "
echo "7-combined.txt [9k]"
echo "8-raft-large-directories.txt  [62K] "
echo "9-Common_PHP_Filenames.txt [5k]"
echo "10-raft-large-files.txt   [37K]"
echo "11-Apache.txt  [9k]"
                echo "";
                echo "\e[1;32m[!] Enter the List Number:\e[0m";
read choice
                echo "";
                echo "\e[1;32m[!] Enter the no of Threads:\e[0m";
read thread
  export dir=`echo $1|sed 's/\///g'`
  case $choice in
     1)
          wfuzz  -t $thread -f wfuzz-out/$dir-output-`date +%s`.txt -f $1-output-`date +%s`.txt --sc $2 -w tools/web-discovery/content_discovery_all.txt $1 $1

          ;;
     2)
          wfuzz  -t $thread -f wfuzz-out/$dir-output-`date +%s`.txt --sc $2 -w tools/web-discovery/Top10000-RobotsDisallowed.txt $1  
          ;;
     3)
          wfuzz  -t $thread -f wfuzz-out/$dir-output-`date +%s`.txt --sc $2 -w tools/web-discovery/big.txt $1 
          ;;
     4)
          wfuzz  -t $thread -f wfuzz-out/$dir-output-`date +%s`.txt --sc $2 -w tools/web-discovery/Parameters.txt $1 
          ;;
     5)
          wfuzz  -t $thread -f wfuzz-out/$dir-output-`date +%s`.txt --sc $2 -w tools/web-discovery/cgis.txt $1
          ;;
     6)
          wfuzz  -t $thread -f wfuzz-out/$dir-output-`date +%s`.txt --sc $2 -w tools/web-discovery/quickhits.txt $1 
          ;;
     7)
          wfuzz  -t $thread -f wfuzz-out/$dir-output-`date +%s`.txt --sc $2 -w tools/web-discovery/combined.txt $1
          ;;
     8)
          wfuzz  -t $thread -f wfuzz-out/$dir-output-`date +%s`.txt --sc $2 -w tools/web-discovery/raft-large-directories.txt $1
          ;;
     9)
          wfuzz  -t $thread -f wfuzz-out/$dir-output-`date +%s`.txt --sc $2 -w tools/web-discovery/Common_PHP_Filenames.txt $1
          ;;
     10)
          wfuzz  -t $thread -f wfuzz-out/$dir-output-`date +%s`.txt --sc $2 -w tools/web-discovery/raft-large-files.txt $1
          ;;

     11)
          wfuzz  -t $thread -f wfuzz-out/$dir-output-`date +%s`.txt --sc $2 -w tools/web-discovery/Apache-Fuzz.txt $1

          ;;

     *)
                echo "File Not Found Enter the file Path:"
                read path
                echo "File Not Found Enter the file Path:"        
                read url
          wfuzz  -t $thread -f $1-output-`date +%s`.txt --sc $2 -w $path  -t $thread -f $1-output-`date +%s`.txt  $url
          ;;
esac
