import streamlit as st
import pickle 
st.sidebar.image("img.jpg",use_column_width=True)
st.sidebar.title("News Analysis")

st.header("News Analysis".upper())
st.empty()


option2 = st.sidebar.checkbox("creator info")
if option2:
    st.info("Project by Ritik Srivastava,Akash Kumar Singh")
    st.info("KIET, MCA")

option4 = st.sidebar.checkbox("Project Info")
if option4:
    st.header("Project details")
    st.success('''
        In this project, we have used various natural language processing techniques and machine learning algorithms to classifty fake news articles using sci-kit libraries from python. the project output is to avoid fake news .   ''')

option3 = st.sidebar.checkbox("project process")
if option3:
    st.info("### project details")
    st.image('images/ProcessFlow.PNG',use_column_width=True)


option6 = st.sidebar.checkbox("Random Classification Result")
if option6:
    st.sidebar.image('images/RF_LCurve.png',use_column_width=True)

option7 = st.sidebar.checkbox("Logistic Classification Result")
if option7:
    st.sidebar.image('images/LR_LCurve.PNG',use_column_width=True)


#function to run for prediction
def detecting_fake_news(var):    
#retrieving the best model for prediction call
    load_model = pickle.load(open('final_model.sav', 'rb'))
    prediction = load_model.predict([var])
    prob = load_model.predict_proba([var])
    return prediction[0],prob[0][1]

data = st.text_area("Copy a News headline to test")
if st.button("analyse"):
    if data :
        with st.spinner('please wait, while we analyse this message'):
            prediction,confidence = detecting_fake_news(data)
            if confidence >.6:
                st.success(f"## The news is NOT FAKE")
                st.image('images/fact.png',width=150)
                st.write(f"probability:{confidence} | {prediction}")
            else:
                st.warning(f"## Its Fake news")
                st.image('images/fake.jpg',width=150)
                st.write(f"probability:{confidence} | {prediction}")
    else:
        st.error("enter some message to analyse")
else:
    st.info('click button to analyse')
if data and st.checkbox("other info"):
    st.write(f"length of message {len(data)}")
    st.write(f"length of words {len(data.split())}")
    st.write(data.split())

