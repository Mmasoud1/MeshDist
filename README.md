# MeshDist

This is a light distributed version of MeshNet using [Coinstac](https://github.com/Mmasoud1/MeshDist/wiki/Coinstac-Setup). 

## Local Setup


1- Clone this repository:

         git clone https://github.com/Mmasoud1/MeshDist.git

	     cd MeshDist

2- Download training dataset from this [link](https://drive.google.com/file/d/1ONjE0LN-HRIimJmTsSgHZPQBdqVRXrd8/view?usp=sharing), and place copies into each local? e.g. /test/input/local0/simulatorRun/


3- Build the Docker image (Docker must be running):

         docker build -t avg_test_meshnet_no_wan .
      


4- Run the code:

         coinstac-simulator
      

<br>
<br>

For setup issues and possible fixes please refer to [Wiki](https://github.com/Mmasoud1/MeshDist/wiki/Troubleshooting)

