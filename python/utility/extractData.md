The GetPredictedGenderData class is designed to retrieve data about randomly generated users from the "randomuser.me" API and predict their gender using the "genderize.io" API. The class provides methods for obtaining user data, making gender predictions, and generating a dataframe with relevant information.

# Usage
```
# Create an instance of GetPredictedGenderData
gender_data_instance = GetPredictedGenderData()

# Get data for a specified number of samples
result_df = gender_data_instance.getData(samples=20)

# Display the final dataframe
print(result_df)
```

# Example Output
```

   first_name   last_name gender(actual) gender(predict) probability same_gender
0     Natalia      Stavik         female          female         1.0        True
1     Vincent     Carlson           male            male         1.0        True
2        Iida       Kokko         female          female        0.92        True
3      Suzana  Ignjatović         female          female         1.0        True
4       سورنا       موسوی           male            None         0.0       False
5     Bibiano       Moura           male            male         1.0        True
6       Armin       Simon           male            male        0.99        True
7      Sophia        Chow         female          female         1.0        True
8       Borka       Pavić         female          female        0.88        True
9     Mathieu       Morin           male            male        0.99        True
10      Alice      Fogaça         female          female         1.0        True
11     Debbie      Hanson         female          female         1.0        True
12    Taahira      Shroff         female          female         1.0        True
13    Aayushi      Pujari         female          female         1.0        True
14      Elmer       Welch           male            male         1.0        True
15     Mikita    Demedyuk           male          female        0.95       False
16      Alice       Watts         female          female         1.0        True
17     Aurora       Blanc         female          female         1.0        True
18   Savannah  Zimmermann         female          female         1.0        True
19      Lilja      Hakala         female          female        0.99        True

```
## Methods
### __init__(self) -> None
Initialize the class with the final column names.

### getData(self, samples: int) -> pd.DataFrame
Retrieve random user data, predict gender, and create a DataFrame.

Parameters:

samples (int): Number of random user data samples to retrieve.
Returns:

pd.DataFrame: DataFrame containing the requested data.
### __requestUserData(self) -> pd.DataFrame
Private method to make a request to the "https://randomuser.me/api" endpoint and normalize the JSON response into a Pandas DataFrame.

Returns:
pd.DataFrame: Normalized user data DataFrame.
### __requestGenderPred(self, user_data: pd.DataFrame) -> dict
Private method to make a request to the "https://api.genderize.io" endpoint for gender prediction based on the user's first name.

Parameters:

user_data (pd.DataFrame): User data DataFrame.
Returns:

dict: Gender prediction information.
### __generateNewRow(self, user_data: pd.DataFrame, gender_pred: dict) -> pd.DataFrame
Private method to generate a new row based on user data and gender prediction information.

Parameters:

user_data (pd.DataFrame): User data DataFrame.
gender_pred (dict): Gender prediction information.
Returns:

pd.DataFrame: DataFrame containing the new row.