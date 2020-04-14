library(datasets)
data("iris")

# ヒストグラムを確認
layout(matrix(1:2, 1, 2))
hist(iris$Petal.Width)
hist(iris$Sepal.Width)

# Shapiro-Wilk test （シャピロ・ウィルクの検定）
shapiro.test(x=iris$Petal.Width)
shapiro.test(x=iris$Sepal.Width)

# Sepal.Width が正規分布に近いので、平均値の検定（T検定）をしてみる。
# 例として、平均が2.99といえるか？
t.test(iris$Sepal.Width, mu=2.99)

# ヒストグラムと確率密度分布をプロット
# 正規分布N(mean(iris$Sepal.Width), sd(iris$Sepal.Width))もプロット
library(ggplot2)

dens <- density(iris$Sepal.Width)
bw <- diff(range(iris$Sepal.Width))/20

iris$t_dat<-dt(iris$Sepal.Width+mean(iris$Sepal.Width), length(iris$Sepal.Width)-1)
iris$norm_dat<-dnorm(iris$Sepal.Width, mean=mean(iris$Sepal.Width), sd=sd(iris$Sepal.Width))

ggplot(iris, aes(x=Sepal.Width)) +
  geom_histogram(aes(y=..density..), binwidth=bw, fill='skyblue', color='black') +
  geom_density(fill='black', alpha=0.3) +
  geom_line(aes(y=iris$norm_dat), color='red') +
  xlim(range(dens$x))



#q <- qt(c(0.025, 0.975), length(iris$Sepal.Width))

#p <- ggplot()
#p <- p + geom_path(data=data.frame(X=x<-seq(-4,4,len=101), Y=dt(x, length(iris$Sepal.Width))), aes(x=X, y=Y))
#p <- p + geom_ribbon(data=data.frame(X=x<-seq(q[1],q[2],len=101), Y=dt(seq(q[1],q[2],len=101), length(iris$Sepal.Width))), aes(x=X, y=Y, ymin=0, ymax=Y))
#p <- p + geom_ribbon(data=data.frame(X=x<-seq(q[1],q[2],len=101), Y=dt(x, length(iris$Sepal.Width))), aes(x=X, y=Y, ymin=0, ymax=Y))
#print(p)
