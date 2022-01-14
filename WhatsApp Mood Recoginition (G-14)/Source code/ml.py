import text2emotion as te
import collections
from collections import Counter

# text ="i need a partner for my college"
# text = "The same person who said the  things to me also said some of the meanest things I've ever heard."
# text ="i am pursuing MCA from KIET"
# print(te.get_emotion(text))
def model():
    print("Enter you words")
    status_whatsapp = input()
    my_dict = te.get_emotion(status_whatsapp)
    values = list(my_dict.values())
    key = list(my_dict.keys())
    print("************************")
    print("************************")
    result = key[values.index(max(values))]
    print(result)
    print("************************")
    print("************************")


# --------------------------
# this function i can you later if some error occur
# -----------------------
def model1():
    print("Enter you words")
    status_whatsapp = input()
    my_dict = te.get_emotion(status_whatsapp)

    k = Counter(my_dict)
    high = k.most_common(3)

    # print(my_dict, "\n")

    print("Dictionary with 3 highest values:")
    print("Keys: Values")

    for i in high:
        print(i[0], " :", i[1], " ")


# ---------------------
# -------------------
model1()
# model()