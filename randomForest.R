# randomForest score = 0.77512 

fit.rf <- train(Survived~Pclass + Sex + Age + SibSp + Parch + Fare +
                            Embarked + Title + FamilySize + FamilyID, 
                    data=train, 
                    method="rf",
                    trControl=trainControl(method = "cv",number = 5))
print(fit.rf)

Prediction_rf <- predict(fit.rf, test, OOB=TRUE)
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction_rf)
write.csv(submit, file = "RandomForest.csv", row.names = FALSE)