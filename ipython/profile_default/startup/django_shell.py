try:
    from django.db.models import *
    from django.db.models import Value as V
    from django.db.models.expressions import *
    from django.db.models.functions import *
    from django.db.models.lookups import *
    from django.forms.models import model_to_dict
except ImportError:
    pass


def val(queryset):
    return tuple(queryset.values())


def random5(model_class, using="default"):
    """Fetches 5 random instances of a model from the database."""
    return tuple(model_class.objects.using(using).order_by("?").values()[:5])


def first5(model, using="default"):
    """Fetches first (pk-wise) 5 instances of a model from the database."""
    return tuple(model.objects.using(using).order_by("id").values()[:5])


def last5(model, using="default"):
    """Fetches last (pk-wise) 5 instances of a model from the database."""
    return tuple(model.objects.using(using).order_by("-id").values()[:5])
