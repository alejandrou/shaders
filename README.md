<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Tabla de contenidos</summary>
  <ol>
    <li>
      <a href="#Autor">Autor</a>
    </li>
    <li>
      <a href="#Trabajo realizado">Trabajo realizado</a>
    </li>
    <li><a href="#decisiones-adoptadas">Decisiones adoptadas</a></li>
    <li><a href="#referencias">Referencias</a></li>
    <li><a href="#herramientas">Herramientas</a></li>
    <li><a href="#resultado">Resultado</a></li>
  </ol>
</details>




## Autor

El autor de este proyecto es el estudiante Alejandro Daniel Herrera Cárdenes para la asignatura Creando Interfaces de Usuario (CIU) para el profesor Modesto Fernando Castrillón Santana. 


## Trabajo realizado

El trabajo se basa en hacer una escena con iluminación usando los shaders.

## Decisiones adoptadas

Las mayores decisiones tomadas y las que mas pruebas requirieron fue el uso de los shaders para proporcionar iluminación a la escena


* Metodo que manejan la iluminación.
  ```
    void setLight() {
    if (shaderOff) {
      float val = (float)light/(float)width*float(255);
      ambientLight((int)val, val, val);
      pointLight(204, 153, 0, light, height/2, 400);
    } else {
      float dirY = (mouseY / float(height) - 0.5) * 6;
      float dirX = (mouseX / float(width) - 0.5) * 6;
      directionalLight(240, 240, 240, -dirX, -dirY, -1);

      if (posCam.z > -width && posCam.z < -width/2) {
        shader(sh);
      }   else if (posCam.z < -width) {
        shader(sh);
        sh.set("u_resolution", float(width), float(height));
        sh.set("u_time", float(millis())/float(1000));
      }
    }
  }
 <p align="center"><img src="images/escena.png" alt="Escena" width="500" height="500"></br>Pantalla final</p>
 


## Referencias

Para ayudarme en la realización de esta aplicación usé la API que te proporciona [Processing](https://www.processing.org/).

* [Documentación de clase](https://ncvt-aep.ulpgc.es/cv/ulpgctp21/pluginfile.php/412240/mod_resource/content/40/CIU_Pr_cticas.pdf).

* [Processing](https://www.processing.org/)




## Resultado

Añado un GIF con el resultado de la aplicación final con la escena.

Al ir un poco lento de FPS para realizar el gif usé el programa [Gyazo](https://gyazo.com/) para que sea más visible el uso de la cámara. Se puede ver en el link a continuación. El video esta en la carpeta imágenes en caso de que el link no funcione.
* [Vídeo de la ejecución final](https://gyazo.com/b0c0437340d0e4422d5ea568c0fe34ac).
