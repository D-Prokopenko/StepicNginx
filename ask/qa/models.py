from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse

# Create your models here.

# модель менеджер
class QuestionManager(models.Manager):
    # метод возвращающий последние добавленные вопросы
    def new(self):
        return self.order_by('-added-at')

    # метод возвращающий вопросы отсортированные по рейтингу
    def popular(self):
        return self.order_by('-rating')

class Question(models.Model):
    title = models.CharField(max_length=255)
    text = models.TextField()
    added_at = models.DateTimeField(auto_now_add=True)
    rating = models.IntegerField(default=0)
    author = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    likes = models.ManyToManyField(User, related_name='likes_set')
    objects = QuestionManager()

    def __unicode__(self):
        return self.title

    def get_url(self):
        return reverse('question', kwargs={'id': self.id})


class Answer(models.Model):
    text = models.TextField()
    added_at = models.DateTimeField(null=True)
    question = models.ForeignKey(Question, null=True, related_name='answer_set', on_delete=models.SET_NULL)
    author = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)

    def __unicode__(self):
        return self.text