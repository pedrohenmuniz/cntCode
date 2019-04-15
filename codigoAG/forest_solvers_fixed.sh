#!/bin/bash

totalCriticals=1
criticals=(0.3)
# criticals=(0.1 0.3 0.5 1 2)

totalDensities=4
densities=(5 10 15 25)

totalSeeds=5
seeds05=(1479650829  1479660410  1479670364  1479680309  1479729478  1480378236  1480382963  1480387613  1480392138  1480396642  1480454472  1480460458  1480466441  1480472432  1480478447  1480484436  1480490440  1480496435  1480502430  1480539260  1480543863  1480548468  1480553074  1480557686  1480562298  1480566914  1480571537  1480576161  1480580790  1 ) # seeds para a floresta de densidade 5
seeds10=(1479653218  1479662895  1479672848  1479682797  1479731878  1480379414  1480384140  1480388750  1480393266  1480397760  1480455964  1480461952  1480467936  1480473929  1480479941  1480485930  1480491939  1480497928  1480503925  1480540407  1480545012  1480549617  1480554226  1480558839  1480563452  1480568069  1480572691  1480577315  1480581943  1) # seeds para a floresta de densidade 10
seeds15=(1479655606  1479665379  1479675327  1479685275  1479734309  1480380603  1480385292  1480389879  1480394397  1480398875  1480457462  1480463447  1480469433  1480475427  1480481439  1480487432  1480493435  1480499425  1480505423  1480541557  1480546163  1480550768  1480555378  1480559990  1480564604  1480569222  1480573846  1480578469  1480583093  1) # seeds para a floresta de densidade 15
seeds25=(1479657997  1479667867  1479677816  1479687750  1479736734  1480381788  1480386446  1480391005  1480395518  1480400006  1480458958  1480464940  1480470929  1480476938  1480482935  1480488930  1480494933  1480500927  1480506922  1480542709  1480547314  1480551920  1480556530  1480561144  1480565757  1480570378  1480575003  1480579632  1480584250  1 ) # seeds para a floresta de densidade 25 

# Colocar while do read_solution ( para ler ou não a solução da lili)
d=0
while(($d<$totalDensities))
do
	echo $d 'Densidade' ${densities[d]}
	s=0
	while(($s<$totalSeeds))
	do	
        seed=${seeds05[s]}
        if [ ${densities[d]} -eq 10 ] ; then		
            seed=${seeds10[s]}
        fi
        if [ ${densities[d]} -eq 15 ] ; then		
            seed=${seeds15[s]}
        fi
        if [ ${densities[d]} -eq 25 ] ; then		
            seed=${seeds25[s]}
        fi
        echo $s 'Seed' $seed
		c=0
		while(($c<$totalCriticals))
		do
			echo $c 'critical' ${criticals[c]}
			# /home/pedro/Área\ de\ Trabalho/Diversos/CNT/projetoCNT/exec "-d" ${densities[d]} "-s" ${seed[s]} "-c" ${criticals[c]}
			/home/pedrohen/Documentos/cntCode/codigoAG/bin/Debug/cntOptimizaton "-d" ${densities[d]} "-s" $seed "-c" ${criticals[c]} 
			#Adicionar "-r" ${read_solution[r]} na linha de cima, como parametro do codigo em c
			#/home/pedro/Área\ de\ Trabalho/Diversos/CNT/projetoCNT/exec "-d" 25 "-s" ${seed[s]} "-c" ${criticals[c]}
			#/home/pedro/Área\ de\ Trabalho/Diversos/CNT/projetoCNT/exec r ${densities[d]} ${seed[s]} ${criticals[c]}
			#/home/liliane/Documentos/GIT/gcgtube/build/Release/Visualizer r ${densities[d]} $seed 10 ${criticals[c]} ${methods[m]}
			c=$((c+1))
		done
		s=$((s+1))
	done	
	d=$((d+1))
done

