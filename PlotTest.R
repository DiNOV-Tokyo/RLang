library("datasets")
data("iris")

hist(iris$Petal.Width)
shapiro.test(x=iris$Petal.Width)

hist(iris$Sepal.Width)
shapiro.test(x=iris$Sepal.Width)
t.test(iris$Sepal.Width, mu=2.99)

plot(iris[,1:4])