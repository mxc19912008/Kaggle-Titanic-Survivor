# Lasso score =  0.80383
set.seed(12)
fit.glmnet <- train(Survived~Pclass + Sex + Age + SibSp + Parch + Fare +
                            Embarked + Title + FamilySize + FamilyID, 
                    data=train, 
                    method="glmnet",
                    trControl=trainControl(method = "cv",number = 5))
print(fit.glmnet)
Prediction_l <- predict(fit.glmnet, test, OOB=TRUE)
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction_l)
write.csv(submit, file = "Lasso.csv", row.names = FALSE)