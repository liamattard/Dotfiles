
#!/bin/bash
echo -e "1" | sudo update-alternatives --config java > /dev/null
echo -e "1" | sudo update-alternatives --config javac > /dev/null
echo -e "1" | sudo update-alternatives --config javap>/dev/null
echo -e "1" | sudo update-alternatives --config jar>/dev/null
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export PATH=$JAVA_HOME/bin:$PATH
