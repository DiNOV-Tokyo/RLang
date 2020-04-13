library("datasets")
data("iris")
hist(iris$Sepal.Width)
shapiro.test(x=iris$Sepal.Width)

hist(iris$Petal.Width)
shapiro.test(x=iris$Petal.Width)

plot(iris[,1:4])