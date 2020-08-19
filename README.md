# Installs [GraalVM CE 20.2.0](https://www.graalvm.org/) with [Java 11](https://openjdk.java.net/) on [Ubuntu](https://www.ubuntu.com/)

```bash
wget -q https://script.install.devinsideyou.com/graalvm
sudo chmod +x graalvm && ./graalvm
```

# Specifies [both Java and GraalVM versions](https://github.com/graalvm/graalvm-ce-builds/releases) (optional)

```bash
wget -q https://script.install.devinsideyou.com/graalvm
sudo chmod +x graalvm && ./graalvm 11 20.2.0
```

# Specifies [just the Java version](https://github.com/graalvm/graalvm-ce-builds/releases) (optional)

```bash
wget -q https://script.install.devinsideyou.com/graalvm
sudo chmod +x graalvm && ./graalvm 11
```
