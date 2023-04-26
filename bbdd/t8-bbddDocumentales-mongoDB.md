# MongoDB



## Java
```
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
```
**IMPORTANTE**: se requiere librería jar.
### lib vía MVN:
Dentro del archivo `pom.xml` encontraremos `<dependencies></dependencies>`. Ahí deberemos añadir:
```
<!-- https://mvnrepository.com/artifact/org.mongodb/mongodb-driver-sync -->
<dependency>
    <groupId>org.mongodb</groupId>
    <artifactId>mongodb-driver-sync</artifactId>
    <version>4.9.1</version>
</dependency>

```


## PHP
+ [Ref doc oficial](https://www.mongodb.com/docs/php-library/current/tutorial/)
+ [Config](https://www.mongodb.com/developer/languages/php/php-setup/)

**IMPORTANTE**: se requiere conector instalado en el intérprete PHP.
### lib vía `composer`:
`$ composer require mongodb/mongodb`

Si tu servidor no tiene composer, pero tienes docker instalado puedes correrlo vía docker con `docker run --rm --interactive --tty -v ./app:/app composer composer require mongodb/mongodb`. Ésto copiara las dependencias en la carpeta local `./app`.



## Node.js
+ [Ref doc oficial](https://www.mongodb.com/docs/drivers/node/current/)
+ [Instalación driver](https://www.mongodb.com/developer/languages/javascript/node-connect-mongodb/)


# Referencias
+ [Doc oficial](https://www.mongodb.com/docs/)
+ [Abril Code](https://adatos.abrilcode.com/doku.php?id=apuntes:mongodb)