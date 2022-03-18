NombreRepositorio=ArchivosPython2
Rama=main4

rm -rf .git

git init
#git add PythonBasicos/*.*
git add 00_ExperimentosHojas
git add 01_InterfacesQt
git add 02_IoT
git add 03_LenguajesAutomatas
git add 04_MachineLearning
git add 05_ProcesamientoImagenes
git add 06_PythonBasicos
git commit -m "second commit"
git remote add origin https://github.com/marco-nuno-maganda/${NombreRepositorio}.git
git branch -M ${Rama}
git push -u origin ${Rama}
