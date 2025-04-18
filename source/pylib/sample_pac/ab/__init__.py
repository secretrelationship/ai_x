'''
sample_pac/ab/__init.py
from sample_pac.ab import * 수행할경우
자동 import 될 모듈 지정할 수 있음(__ab__)

sample_pac/ab/a.py
sample_pac/ab/b.py
'''
__all__ = ['a']
print('sample_pac 패키지안의 ab패키지 로드됩니다.')