import 'package:flutter/material.dart';

class Disease{
  String title;
  String RiskFactors;
  String description;
  String prevent;
  String imgurl;

  Disease(
      { required this.title,
        required this.RiskFactors,
        required this.description,
        required this.prevent,
        required this.imgurl});
}

List<Disease> diseasesList =[


  Disease(
    title: 'Tinea Ringworm',
    description: 'Ringworm of the body (tinea corporis) is a rash caused by a fungal infection.\n It is usually an itchy, circular rash with clearer skin in the middle.\n Ringworm gets its name because of its appearance,No worm is involved.',
    RiskFactors: '•	Live in a warm climate.\n• Have close contact with an infected person or animal.\n'
        '• Share clothing, bedding or towels with someone who has a fungal infection.\n•	Participate in sports that feature skin-to-skin contact, such as wrestling.\n• Wear tight or restrictive clothing.\n•	Have a weak immune system.\n',
    prevent: '• Avoid infected animals.The infection often looks like a patch of skin where fur is missing.\n'
        '• Do not share personal items. Do not let others use your clothing, towels, hairbrushes, sports gear or other personal items.\n'
        '• Wash your hands often. Keep shared areas clean.\n• Do not Wear tight or restrictive clothing.\n• Keep the infected area clean and dry.\n• Throw out infected items.\n• Treat all ringworm at the same time.',
    imgurl: 'images/1.png',),
  Disease(
    title: 'Warts Molluscum',
    description: 'Molluscum contagiosum is an infection caused by a poxvirus virus.\nThe result of the infection is usually a benign, mild skin disease characterized by lesions (growths) that may appear anywhere on the body.\n'
        'Within6-12months, Molluscum contagiosum resolves without scarring but may take as long as 4 years.\nIt occur anywhere on the body including the face, neck, arms, legs, abdomen, and genital area, alone or in groups.\n '
        'The lesions are rarely found on the palms of the hands or the soles of the feet.',
    RiskFactors: '• The bumps and the skin around them may become inflamed. This is thought to be an immune system response to the infection. If scratched, these bumps can become infected and heal with scarring. If sores appear on the eyelids, pink eye (conjunctivitis) can develop.\n'
        '• Shaving over the infected areas can spread the virus.\n'
        '• Scratching or rubbing the bumps, which spreads the virus to nearby skin.\n'
        '• Swimming in pools or hot tubs contaminated with the virus.\n• Sexual contact with an affected partner.\n',
    prevent: '• The best way to prevent your self is to avoid having skin-to-skin contact with someone who has molluscum, and you should:\n'
        '• Keep molluscum lesions covered.\n• Do not scratch or pick molluscum lesions.\n• Avoid shaving over the infected areas.\n• Avoid sexual contact.',
    imgurl: 'images/8.png',),
  Disease(
    title: 'Melanoma',
    description: 'Melanoma, the most serious type of skin cancer, develops in the cells (melanocytes) that produce melanin — the pigment that gives your skin its color.\n'
        ' Melanoma can also form in your eyes and, rarely, inside your body, such as in your nose or throat.\n'
        'The exact cause of all melanomas is not clear, but exposure to ultraviolet (UV) radiation from sunlight or tanning lamps and beds increases your risk of developing melanoma. ',
    RiskFactors: '• Smoking can do damage to cells within the immune system.\n'
        '• Getting too much ultraviolet (UV) radiation from the sun or tanning beds.\n'
        '• Being overweight or having obesity, and drinking too much alcohol.',
    prevent: '•	Limiting your exposure to UV radiation can help reduce your risk of melanoma.\n'
        '• Avoid recreational outdoor sunbathing.\n• Do not use sun lamps, tanning devices, or tanning salons.\n'
        '• Examine your skin regularly.This should include examinations by a health care professional, as well as self-examinations. ',
    imgurl: 'images/11.png',),

  Disease(
    title: 'Basal cell carcinoma',
    description: 'Basal cell carcinoma is a type of skin cancer that most often develops on areas of skin exposed to the sun, such as the face.'
        '\n On brown and Black skin, basal cell carcinoma often looks like a bump that is brown or glossy black and has a rolled border.',
    RiskFactors: '• Chronic sun exposure. A lot of time spent in the sun — or in commercial tanning beds — increases the risk of basal cell carcinoma.\n•	Fair skin. The risk of basal cell carcinoma is higher among people who freckle or burn easily or who have very light skin.\n•	Exposure to arsenic. Arsenic, a toxic metal that is found widely in the environment, '
        'increases the risk of basal cell carcinoma and other cancers.',
    prevent: '•	Avoid the sun during the middle of the day. Schedule outdoor activities for other times of the day.\n'
        '• Wear sunscreen year-round.even on cloudy days.\n• Wear protective clothing, Cover your skin with dark, tightly woven clothing that covers your arms and legs.\n•	Avoid tanning beds, Tanning beds emit UV rays and can increase your risk of skin cancer.',

    imgurl: 'images/3.png',),

  Disease(
    title: 'Melanocytic nevus',
    description: 'A melanocytic nevus is a disorder of the skin cells which produces pigmentation.\n These are generally non-cancerous in nature and are more commonly known as moles.\n These moles may either exist since your birth or you might develop them later in your life.\n Most moles are harmless. Rarely, they become cancerous.\n Being aware of changes in your moles and other pigmented patches is important to detecting skin cancer, especially malignant melanoma.',
    RiskFactors: 'A mole may be a sign of skin cancer if it has irregular borders or an asymmetrical shape or if it changes in color, shape, size or height.\n'
        ' This ABCDE guide can help you remember what to watch for:\n'
        '• A is for asymmetrical shape. One half is unlike the other half.\n'
        '• B is for border. Look for moles with irregular, notched or scalloped borders.\n'
        '• C is for color. Look for growths that have changed color, have many colors or have uneven color.\n'
        '• D is for diameter. Look for new growth in a mole larger than 1/4 inch (about 6 millimeters).\n'
        '• E is for evolving. Watch for moles that change in size, shape, color or height. Moles may also evolve to develop new signs and symptoms, such as itchiness or bleeding.\n',
    prevent: '•	Avoid spending time in the sun and avoid tanning beds.\n'
        '• Wear sunscreen every day when outdoors with an SPF of 30 or more.\n'
        '• Wear protective clothing when you are in the sun.\n'
        '• Check your own skin frequently.\n'
        '• Visit your dermatologist regularly to have skin exams.\n',
    imgurl: 'images/19.png',),

  Disease(
    title: 'Chickenpox',
    description: 'Chickenpox is an illness caused by the varicella-zoster virus. It brings on an itchy rash with small, fluid-filled blisters.\n Chickenpox spreads very easily to people who have not had the disease or have not gotten the chickenpox vaccine. Chickenpox used to be a widespread problem, but today the vaccine protects children from it.',
    RiskFactors: 'You are at risk if you have chronic condition, such as asthma, who take medicine that calms immune response.'
        '\n Or those who have had an organ transplant and take medicine to limit the immune system action.'
        '\n young children (<1 year of age), Pregnant women who haven not had chickenpox.'
        '\n It can be serious and can lead to other health problem including:'
        '\n• Infected skin, soft tissues, bones, joints or bloodstream caused by bacteria.'
        '\n• Dehydration, when the body runs too low on water and other fluids.'
        '\n• Pneumonia, an illness in one or both lungs.'
        '\n• Toxic shock syndrome, a dangerous complication of some illnesses caused by bacteria.'
        '\n• Reyes syndrome, a disease that causes swelling in the brain and liver. This can happen in children and teens who take aspirin during chickenpox.'
        '\n• Death, in rare cases.',
    prevent: 'Chickenpox vaccine, also called the varicella vaccine, is the best way to prevent chickenpox.\n'
        '• Avoid close contact with people who have a rash that looks like chickenpox.\n'
        '• Avoid handling clothes, sheets, blankets or other materials that have been in contact with an infected person.\n'
        '• Isolate people who have chickenpox from healthy people.\n• Wash your hands well with soap and water after any contact with an infected person.',
    imgurl: 'images/12.png',),

];
