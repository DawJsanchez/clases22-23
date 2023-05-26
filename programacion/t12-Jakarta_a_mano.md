# Crear mi primera web JSP - Servlet (a mano)

## JSP

No se requiere **NADA** especial. Sólo crea tu página JSP y mételo en la carpeta webapps ( normalmente en /usr/local/tomcat/webapps

## Despliegue

Si lo vas a desplegar con docker...

```yml
version: '3.3'
services:
  tomcat:
    image: tomcat:10
    ports:
      - 8888:8080
    container_name: tomcat
    volumes:
      - ./aplicaciones:/usr/local/tomcat/webapps
```

Ahora mete tus JSPs en la carpeta aplicaciones o en alguna subcarpeta y ya lo tendrás.

### 1 More Thing

Como somos espaÑoles y nos encantan nuestras tildes y sobre todo la **Ñ**, no te olvides de añadir en las primeras líneas la directiva `<%@page contentType="text/html" pageEncoding="UTF-8"%>`.

Sí, si lo pones con el tag `<meta ...>` en el `<head>` de la web no funciona. Lo ignora completamente.

## Servlet

Aquí ya tenemos un par de pasos extra.

1. Tendremos que descargar la librería que implementa la interface `servlet`, normalmente desde Maven.
   
    **Ojo** deberás descargar aquella que soporte tu servidor de aplicaciones. Por ejemplo Tomcat 9 soporta Servlet-4 (`javax`) y Tomcat 10 soporta Servlet-5 (`jakarta`) por lo que ten mucho ojito y debes casar las importaciones (`javax` o `jakarta`, la impementación (el mvn descargado) y la versión de Tomcat. Aquí, quien manda es la versión del servidor, que es el que no podremos cambiar.

2. Descargada la librería, deberás exponerla al `CLASSPATH` mediante el comando `export CLASSPATH=/ruta_absoluta/jakarta.servlet-api-5.0.0.jar` (cambia la versión en función del servidor de despliegue utilizado.

3. Compila: `javac -d ./aplicaciones/ruta/WEB-INF/classes *.java`. Con ésto compilaremos todos los servlets y se ubicarán en el paquete correspondiente dentro de la carpeta `classes`.

4. Para acceder. Desde el navegador `http://localhost:8888/ruta/miServlet`. Teniendo en cuenta que hayamos `anotado` *miServlet* como ruta de acceso.

### Ejemplo:

```java
package com.ejemplo;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "com.ejemplo.MiServlet", value = "/mi")
public class MiServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");

    PrintWriter out = response.getWriter();
    out.println("<h1>Hello World</h1>");
    }
}
```

## Empaquetado WAR

Usaremos la utilidad `jar`:
`jar -c -f /ruta_destiono/miPrimerServlet.war -m META-INF/MANIFEST.MF *`

Ésto empaquetará todos los archivos y subdirectorios (*) del directorio actual dentro del `war` *miPrimerServlet.war* según lo indicado en el Manifiesto (copia tal cual), que podremos desplegar con sólo ubicarlo en la carpeta `webapps` del servidor.

Ejemplo de manifiesto:

```webmanifest
Manifest-Version: 1.0
Created-By: A mano
Built-By: Luis Ferreira
Build-Jdk: version 17.0.5
```



## Referencias:

+ [Compilar Servlet a mano](https://aravindvasu.dev/2018/writing-your-first-jsp-and-servlet-using-vim/)
