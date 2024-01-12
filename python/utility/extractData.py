import requests
import pandas as pd

class GetPredictedGenderData:
    def __init__(self) -> None:
        """
        Initialize the class with the final column names.
        """
        self.final_col = ['first_name','last_name','gender(actual)','gender(predict)','probability','same_gender']
    
    def getData(self, samples: int) -> pd.DataFrame:
        """
        Retrieve random user data, predict gender, and create a DataFrame.

        Parameters:
        - samples (int): Number of random user data samples to retrieve.

        Returns:
        - pd.DataFrame: DataFrame containing the requested data.
        """
        final_df = pd.DataFrame(columns=self.final_col)
        for _ in range(0, samples):
            try:
                user_data = self.__requestUserData()
                gender_pred = self.__requestGenderPred(user_data)
                new_row = self.__generateNewRow(user_data, gender_pred)
                final_df = pd.concat([final_df, new_row], ignore_index=True)                              
            except Exception as e:
                print(f"Error in getData: {e}")
        return final_df
    
    def __requestUserData(self) -> pd.DataFrame:
        try:
            reqData = requests.get('https://randomuser.me/api').json()
            user_data = pd.json_normalize(reqData['results'])
            interested_col = ['name.first','name.last','gender']
            user_data = user_data[interested_col]
            return user_data
        except Exception as e:
            print(f"Error in __requestUserData: {e}")
            raise

    def __requestGenderPred(self, user_data: pd.DataFrame) -> dict:
        try:
            response = requests.get(f"https://api.genderize.io/?name={user_data['name.first'][0]}")
            response.raise_for_status()  # Raise an HTTPError for bad responses
            return response.json()
        except requests.RequestException as e:
            print(f"Error in __requestGenderPred: {e}")
            raise

    def __generateNewRow(self, user_data: pd.DataFrame, gender_pred: dict) -> pd.DataFrame:
        new_row = user_data.values.flatten().tolist()
        new_row.extend([gender_pred['gender'], gender_pred['probability'], gender_pred['gender'] == user_data['gender'][0]])
        new_row_df = pd.DataFrame(new_row).transpose()
        new_row_df.columns = self.final_col
        return new_row_df


