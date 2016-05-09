# El Capitán
Redmine plugin to control worked hours for each user and alert each week.

## Getting started

### 1. Instalación del plugin
- Parar Redmine
- Clonar el repositorio en raiz_redmine/plugins.El directorio del plugin debe ser el_capitan

	```
	git@github.com:AgiliaCenter/El-Capitan.git
	``` 
	
- Ejecutar:

  ```
    rake redmine:plugins:migrate NAME=el_capitan RAILS_ENV=production
  ```
  
- En el fichero config/application.rb añadir la siguiente entrada:
  ```
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  ``` 
  
- Iniciar Redmine

#### Configurar alerta al final de la semana

El plugin está pensado para que mande las alertas a final de cada semana pero hay que configurarlo en el cron del sistema. Por ejemplo si queremos ejecutar la alerta los viernes a las 15h debemos añadir la siguiente entrada:

 ``` 
 00 15 * * 5 cd ruta_donde_esta_instalado_redmine && rake el_capitan:weekhours
 ```  
 
 Por defecto redmine tiene como idioma el inglés y las alertas llegarán en inglés. Si quieres que te lleguen en español, en el fichero config/applications añadir:
 ```
 config.i18n.default_locale = :es
 ```


### 2. Eliminar el plugin

  - Parar Redmine
  - Ejecutar:
  
    ```
      rake redmine:plugins:migrate NAME=el_capitan VERSION=0 RAILS_ENV=production
    ```
  - Eliminar la carpeta el_capitan que se encuentra en raiz_redmine/plugins
  - En el fichero config/application.rb eliminar la siguiente entrada:
    ```
    config.action_mailer.default_url_options = { host: 'localhost:3000' }
    ```
    
  - Eliminar la entrada del cron que añadistes al instalar el plugin

  - Iniciar Redmine
  
### 3. Permisos

Por defecto, nadie podrá entrar en la configuración del plugin que se encuentra en el menú superior (El_capitan). Para poder seleccionar los miembros que quieres que tengan acceso deberás asignar el permiso El capitan.
  
## Compatibilidad
  El plugin ha sido probado en Redmine v2.6.6.stable

## Versiones  
### 1.0.0

- Permite añadir las horas semanales de los usuarios de Redmine y activar el seguimiento con el reporte semanal (administración/usuarios).
- Los usuarios pueden ver las horas semanales que tienen asignadas y el total de la semana actual (Mi cuenta).
- En la configuración del plugin:
  - Se muestra el reporte de la semana actual de todos los usuarios que tienen horas semanales asignadas. Al principio de semana se   resetea el reporte. 
  - Permite configurar alertas indivudales vía email a todos los miembros que tengan horas asignadas. Esta alerta contendrá las horas de esta semana, las asignadas y la diferencia. Esta alerta también se puede configurar en administración/usuarios.
  - Permite configurar alertas grupales que contendrán el reporte de todos los miembros a los que tenemos activado el seguimiento (opción anterior). El comportamiento de las alertas cambian según las opciones elegidas de cada miembro:
    - Grupal + individual => Recibe un correo con el reporte de todos los miembros y el suyo. El individual no se envía.
    - Grupal sólo => Recibe un correo con el reporte de todos pero el suyo no está incluido.
  - Permite enviar correos de pruebas con el reporte actual. Es importante que se guarde la configuración de las alertas antes de enviarlo.

