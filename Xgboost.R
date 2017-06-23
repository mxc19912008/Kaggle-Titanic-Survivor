# Xgboost Score = 0.77033

fit.XGB <- train(Survived~Pclass + Sex + Age + SibSp + Parch + Fare +
                         Embarked + Title + FamilySize + FamilyID, 
                 data=train, 
                 method="xgbTree",
                 trControl=trainControl(method = "cv",number = 5))
print(fit.XGB)
Prediction_XGB <- predict(fit.XGB, test, OOB=TRUE)
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction_XGB)
write.csv(submit, file = "XGB.csv", row.names = FALSE)  