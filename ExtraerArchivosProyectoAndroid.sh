# Proyecto que extrae todos los datos necesarios de un proyecto AndroidStudio para ser
# reconstruido desde CERO, incluye:
# Los archivos "*.png" "*.jpg" "*.java" "*.xml" "*.jar" 
# El archivo APK del instalador
# Los archivos .graddle (Aplicación y Proyecto)




NombreProyecto=AM_50
NombreProyecto=OpenCV_ArticFox
NombreProyecto=ImperialCollege_Demo03
NombreProyecto=MonitoreoCalcetinV2

NombreArchivo=$NombreProyecto



#NombreProyecto=OpenGLMasCamara
#NombreArchivo=Lesson14-OpenGL_Camara




# Crear un archivo de README con instrucciones...
echo "NombreProyecto $NombreProyecto" > Readme.txt
echo "En caso de contener archivos .jar, agregar al proyecto y con el menu seleccionar "add as library"" >> Readme.txt
echo "Revisar el archivo .graddle, y en caso de tener librerias adicionales, habiliar conexión a internet para permitir la descarga de tal librería" >> Readme.txt
zip $NombreArchivo.zip Readme.txt 


## Arreglo de extensiones de interés
declare -a arr=("*.png" "*.jpg" "*.java" "*.xml" "*.jar" "*.obj" "*.glsl" "*.mp3" )






## Para cada extension agregar al .ZIP
for i in "${arr[@]}"
do
echo "$i"
rm $i
find $NombreProyecto/app/src -name $i -exec cp {} . \;
zip $NombreArchivo.zip $i
rm $i
   # or do whatever with individual element of the array
done


# INCLUIR .JARs adicionales (de necesitarlso
declare -a arr=("*.jar" )
## Para cada extension agregar al .ZIP
for i in "${arr[@]}"
do
echo "$i"
rm $i
find $NombreProyecto/app/libs -name $i -exec cp {} . \;
zip $NombreArchivo.zip $i
rm $i
   # or do whatever with individual element of the array
done


# INCLUIR EL APK
#F=`find $NombreProyecto -name "*.apk"`
F=`find $NombreProyecto/app/build/outputs -name "*.apk"`
cp $F ./$NombreProyecto.apk
zip $NombreArchivo.zip ./$NombreProyecto.apk
rm ./$NombreProyecto.apk


rm *.gradle
cp $NombreProyecto/build.gradle .
mv build.gradle build_raiz.gradle
zip $NombreArchivo.zip build_raiz.gradle
rm *.gradle


cp $NombreProyecto/app/build.gradle .
mv build.gradle build_app.gradle
zip $NombreArchivo.zip build_app.gradle
rm *.gradle
