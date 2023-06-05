from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from .models import Question, Answer
from .utilits import paginate
def test(request, *args, **kwargs):
    return HttpResponse('OK')

def main(request, *args, **kwargs):
    last = Question.objects.order_by('-added_at')
    page = paginate(request, last)
    return render(request, 'main.html', {
        'questions': page.object_list,
        'page': page,
    })

def popular(request):
    reting_up = Question.objects.popular()
    page = paginate(request, reting_up)
    return render(request, 'main.html', {
        'questions': page.object_list,
        'page': page,
    })

def question(request, pk):
    qst = get_object_or_404(Question, id=pk)
    return render(request, 'question.html', {
        'question': qst,
        'answers': qst.answer_set.all()
    })