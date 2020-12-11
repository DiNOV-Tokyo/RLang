library("datasets")
data("iris")

hist(iris$Petal.Width)
shapiro.test(x=iris$Petal.Width)

hist(iris$Sepal.Width)
shapiro.test(x=iris$Sepal.Width)
t.test(iris$Sepal.Width, mu=2.99)

library(ggplot2)

dens <- density(iris$Sepal.Width)
bw <- diff(range(iris$Sepal.Width))/20

iris$t_dat<-dt(iris$Sepal.Width+mean(iris$Sepal.Width), length(iris$Sepal.Width)-1)
iris$norm_dat<-dnorm(iris$Sepal.Width, mean=mean(iris$Sepal.Width), sd=sd(iris$Sepal.Width))

ggplot(iris, aes(x=Sepal.Width)) +
  geom_histogram(aes(y=..density..), binwidth=bw, fill='white', color='black') +
  geom_density(fill='black', alpha=0.3) +
  geom_line(aes(y=iris$norm_dat)) +
  xlim(range(dens$x))

ggplot(iris) +
  geom_histogram(aes(Sepal.Width))

#q <- qt(c(0.025, 0.975), length(iris$Sepal.Width))

#p <- ggplot()
#p <- p + geom_path(data=data.frame(X=x<-seq(-4,4,len=101), Y=dt(x, length(iris$Sepal.Width))), aes(x=X, y=Y))
#p <- p + geom_ribbon(data=data.frame(X=x<-seq(q[1],q[2],len=101), Y=dt(seq(q[1],q[2],len=101), length(iris$Sepal.Width))), aes(x=X, y=Y, ymin=0, ymax=Y))
#p <- p + geom_ribbon(data=data.frame(X=x<-seq(q[1],q[2],len=101), Y=dt(x, length(iris$Sepal.Width))), aes(x=X, y=Y, ymin=0, ymax=Y))
#print(p)
