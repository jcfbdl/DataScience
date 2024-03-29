
#######################################################################################################
#HEC Lausanne - MScF
#Data Science for Finance
#Exercise Session 2 - 27.09.2019
#Marceau Pierron, Taulant Ukshini, David Sasselli
#######################################################################################################


#######################################################################################################
#Question 2.1
#######################################################################################################

mutotal=c()

size=c(30,100,1000,10000)

for(i in size){
	mu=c()
	for(j in 1:1000){
		x=rpois(i,0.5)
		s=mean(x)
		mu=c(mu,s)
	}

	mutotal=cbind(mutotal,mu)

}

colours=c("black","red","green","blue")

par(bty="n")

plot(density(mutotal[,1]),
    ylim=c(0,50),
    col="black",
    main="Question 1.2.1 Poisson Distribution",
    xlab="")

for(k in c(2,3,4)){
    lines(density(mutotal[,k]),
        col=colours[k])
}

legend(x="right",y=0.92,c("30 Observations","100 Observations","1000 Observations","10000 Observations"),
    cex=0.8,
    lty=1,
    col=colours,
    box.lty=0
)


#######################################################################################################
#Question 2.2
#######################################################################################################

mu_func = function(n){
    mu=c()
	for(j in 1:1000){
		x=rpois(n,0.5)
		s=mean(x)
		mu=c(mu,s)
	}

    return(sd(mu))

}

func_1 = function(x){
    return(1/sqrt(x))
}

par(bty="n")

plot(func_1,
    main="Question 1.2.2 Poisson Distribution",
    col="red",
    col.main="black",
    lwd=4,
    xlab="Number of Observations",
    ylab="Volatility of Estimator",
    xlim=c(-50,10000),
    ylim=c(0.01,0.2)
)

i=0

while(i <= 10000){
    points(i,mu_func(i),pch=3)
    i=i+200
}

legend(x="right",y=0.92,c("Estimated Volatility of the Estimator","1/sqrt(n)"),
    cex=0.8,
    lty=c(NA,1),
    col=c("black","red"),
    pch=c(NA,3),
    box.lty=0
)

#nora.koennyu@unil.ch