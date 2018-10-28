for f in /Library/Java/JavaVirtualMachines/*; do
  jenv add $f/Contents/Home
done


#jenv enable-plugin maven
#jenv enable-plugin sbt
#jenv enable-plugin scala
#jenv enable-plugin ant
#jenv enable-plugin gradle
jenv enable-plugin export

mkdir ~/.nvm
