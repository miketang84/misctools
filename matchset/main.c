/* main.c generated by valac 0.15.0.37-026c, the Vala compiler
 * generated from main.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <lua.h>
#include <float.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <gee.h>

#define _g_free0(var) (var = (g_free (var), NULL))
#define _lua_close0(var) ((var == NULL) ? NULL : (var = (lua_close (var), NULL)))
#define _g_object_unref0(var) ((var == NULL) ? NULL : (var = (g_object_unref (var), NULL)))



gint l_sin (lua_State* vm);
gint luaopen_mylib (void);
static gint _l_sin_lua_cfunction (lua_State* vm);
static void _vala_array_add1 (gchar*** array, int* length, int* size, gchar* value);
static void _vala_array_destroy (gpointer array, gint array_length, GDestroyNotify destroy_func);
static void _vala_array_free (gpointer array, gint array_length, GDestroyNotify destroy_func);


gint l_sin (lua_State* vm) {
	gint result = 0;
	lua_State* _tmp0_;
	gdouble _tmp1_ = 0.0;
	gdouble d;
	lua_State* _tmp2_;
	gdouble _tmp3_ = 0.0;
	g_return_val_if_fail (vm != NULL, 0);
	_tmp0_ = vm;
	_tmp1_ = lua_tonumber (_tmp0_, 1);
	d = _tmp1_;
	_tmp2_ = vm;
	_tmp3_ = sin (d);
	lua_pushnumber (_tmp2_, _tmp3_);
	result = 1;
	return result;
}


static gint _l_sin_lua_cfunction (lua_State* vm) {
	gint result;
	result = l_sin (vm);
	return result;
}


static gboolean string_get_next_char (const gchar* self, gint* index, gunichar* c) {
	gunichar _vala_c = 0U;
	gboolean result = FALSE;
	gint _tmp0_;
	gunichar _tmp1_ = 0U;
	gunichar _tmp2_;
	g_return_val_if_fail (self != NULL, FALSE);
	_tmp0_ = *index;
	_tmp1_ = g_utf8_get_char (((gchar*) self) + _tmp0_);
	_vala_c = _tmp1_;
	_tmp2_ = _vala_c;
	if (_tmp2_ != ((gunichar) 0)) {
		gint _tmp3_;
		gchar* _tmp4_ = NULL;
		_tmp3_ = *index;
		_tmp4_ = g_utf8_next_char (((gchar*) self) + _tmp3_);
		*index = (gint) (_tmp4_ - ((gchar*) self));
		result = TRUE;
		if (c) {
			*c = _vala_c;
		}
		return result;
	} else {
		result = FALSE;
		if (c) {
			*c = _vala_c;
		}
		return result;
	}
	if (c) {
		*c = _vala_c;
	}
}


static gchar* g_unichar_to_string (gunichar self) {
	gchar* result = NULL;
	gchar* _tmp0_ = NULL;
	gchar* str;
	const gchar* _tmp1_;
	_tmp0_ = g_new0 (gchar, 7);
	str = (gchar*) _tmp0_;
	_tmp1_ = str;
	g_unichar_to_utf8 (self, _tmp1_);
	result = str;
	return result;
}


static gchar string_get (const gchar* self, glong index) {
	gchar result = '\0';
	glong _tmp0_;
	gchar _tmp1_;
	g_return_val_if_fail (self != NULL, '\0');
	_tmp0_ = index;
	_tmp1_ = ((gchar*) self)[_tmp0_];
	result = _tmp1_;
	return result;
}


static gchar* string_slice (const gchar* self, glong start, glong end) {
	gchar* result = NULL;
	gint _tmp0_;
	gint _tmp1_;
	glong string_length;
	glong _tmp2_;
	glong _tmp5_;
	gboolean _tmp8_ = FALSE;
	glong _tmp9_;
	gboolean _tmp12_;
	gboolean _tmp13_ = FALSE;
	glong _tmp14_;
	gboolean _tmp17_;
	glong _tmp18_;
	glong _tmp19_;
	glong _tmp20_;
	glong _tmp21_;
	glong _tmp22_;
	gchar* _tmp23_ = NULL;
	g_return_val_if_fail (self != NULL, NULL);
	_tmp0_ = strlen (self);
	_tmp1_ = _tmp0_;
	string_length = (glong) _tmp1_;
	_tmp2_ = start;
	if (_tmp2_ < ((glong) 0)) {
		glong _tmp3_;
		glong _tmp4_;
		_tmp3_ = string_length;
		_tmp4_ = start;
		start = _tmp3_ + _tmp4_;
	}
	_tmp5_ = end;
	if (_tmp5_ < ((glong) 0)) {
		glong _tmp6_;
		glong _tmp7_;
		_tmp6_ = string_length;
		_tmp7_ = end;
		end = _tmp6_ + _tmp7_;
	}
	_tmp9_ = start;
	if (_tmp9_ >= ((glong) 0)) {
		glong _tmp10_;
		glong _tmp11_;
		_tmp10_ = start;
		_tmp11_ = string_length;
		_tmp8_ = _tmp10_ <= _tmp11_;
	} else {
		_tmp8_ = FALSE;
	}
	_tmp12_ = _tmp8_;
	g_return_val_if_fail (_tmp12_, NULL);
	_tmp14_ = end;
	if (_tmp14_ >= ((glong) 0)) {
		glong _tmp15_;
		glong _tmp16_;
		_tmp15_ = end;
		_tmp16_ = string_length;
		_tmp13_ = _tmp15_ <= _tmp16_;
	} else {
		_tmp13_ = FALSE;
	}
	_tmp17_ = _tmp13_;
	g_return_val_if_fail (_tmp17_, NULL);
	_tmp18_ = start;
	_tmp19_ = end;
	g_return_val_if_fail (_tmp18_ <= _tmp19_, NULL);
	_tmp20_ = start;
	_tmp21_ = end;
	_tmp22_ = start;
	_tmp23_ = g_strndup (((gchar*) self) + _tmp20_, (gsize) (_tmp21_ - _tmp22_));
	result = _tmp23_;
	return result;
}


static void _vala_array_add1 (gchar*** array, int* length, int* size, gchar* value) {
	if ((*length) == (*size)) {
		*size = (*size) ? (2 * (*size)) : 4;
		*array = g_renew (gchar*, *array, (*size) + 1);
	}
	(*array)[(*length)++] = value;
	(*array)[*length] = NULL;
}


gint luaopen_mylib (void) {
	gint result = 0;
	gchar* _tmp0_;
	gchar* _tmp1_;
	gchar* _tmp2_;
	gchar* _tmp3_;
	gchar* _tmp4_;
	gchar* _tmp5_;
	gchar* _tmp6_;
	gchar* _tmp7_;
	gchar* _tmp8_;
	gchar* _tmp9_;
	gchar* _tmp10_;
	gchar* _tmp11_;
	gchar** _tmp12_ = NULL;
	gchar** tagset;
	gint tagset_length1;
	gint tagset_length2;
	gchar* _tmp13_;
	gchar* passin;
	GeeHashMap* _tmp14_;
	GeeHashMap* tset;
	lua_State* _tmp28_;
	lua_State* vm;
	lua_State* _tmp29_;
	gunichar nc = 0U;
	gunichar rc = 0U;
	gchar** _tmp30_ = NULL;
	gchar** collections;
	gint collections_length1;
	gint _collections_size_;
	gchar** _tmp70_;
	gint _tmp70__length1;
	_tmp0_ = g_strdup ("{{");
	_tmp1_ = g_strdup ("}}");
	_tmp2_ = g_strdup ("{(");
	_tmp3_ = g_strdup (")}");
	_tmp4_ = g_strdup ("{%");
	_tmp5_ = g_strdup ("%}");
	_tmp6_ = g_strdup ("{{");
	_tmp7_ = g_strdup ("}}");
	_tmp8_ = g_strdup ("{^");
	_tmp9_ = g_strdup ("^}");
	_tmp10_ = g_strdup ("{<");
	_tmp11_ = g_strdup (">}");
	_tmp12_ = g_new0 (gchar*, (6 * 2) + 1);
	_tmp12_[0] = _tmp0_;
	_tmp12_[1] = _tmp1_;
	_tmp12_[2] = _tmp2_;
	_tmp12_[3] = _tmp3_;
	_tmp12_[4] = _tmp4_;
	_tmp12_[5] = _tmp5_;
	_tmp12_[6] = _tmp6_;
	_tmp12_[7] = _tmp7_;
	_tmp12_[8] = _tmp8_;
	_tmp12_[9] = _tmp9_;
	_tmp12_[10] = _tmp10_;
	_tmp12_[11] = _tmp11_;
	tagset = _tmp12_;
	tagset_length1 = 6;
	tagset_length2 = 2;
	_tmp13_ = g_strdup ("fndslkjfdso{}nvckb {{ 1234 }} hoidfguerug9e {{984jur348fgdvncn ,mn}} k" \
"vnvifdgvheuriguee3ifd{}jvgbsfsnd{%fl%}kkfdsiu{% fff %}fh{^^}reugf{<reg" \
"fnvg");
	passin = _tmp13_;
	_tmp14_ = gee_hash_map_new (G_TYPE_STRING, (GBoxedCopyFunc) g_strdup, g_free, G_TYPE_STRING, (GBoxedCopyFunc) g_strdup, g_free, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
	tset = _tmp14_;
	{
		gint i;
		i = 0;
		{
			gboolean _tmp15_;
			_tmp15_ = TRUE;
			while (TRUE) {
				gboolean _tmp16_;
				gint _tmp18_;
				gchar** _tmp19_;
				gint _tmp19__length1;
				gint _tmp19__length2;
				gint _tmp20_;
				GeeHashMap* _tmp21_;
				gchar** _tmp22_;
				gint _tmp22__length1;
				gint _tmp22__length2;
				gint _tmp23_;
				const gchar* _tmp24_;
				gchar** _tmp25_;
				gint _tmp25__length1;
				gint _tmp25__length2;
				gint _tmp26_;
				const gchar* _tmp27_;
				_tmp16_ = _tmp15_;
				if (!_tmp16_) {
					gint _tmp17_;
					_tmp17_ = i;
					i = _tmp17_ + 1;
				}
				_tmp15_ = FALSE;
				_tmp18_ = i;
				_tmp19_ = tagset;
				_tmp19__length1 = tagset_length1;
				_tmp19__length2 = tagset_length2;
				_tmp20_ = _tmp19__length1;
				if (!(_tmp18_ < _tmp20_)) {
					break;
				}
				_tmp21_ = tset;
				_tmp22_ = tagset;
				_tmp22__length1 = tagset_length1;
				_tmp22__length2 = tagset_length2;
				_tmp23_ = i;
				_tmp24_ = _tmp22_[(_tmp23_ * _tmp22__length2) + 0];
				_tmp25_ = tagset;
				_tmp25__length1 = tagset_length1;
				_tmp25__length2 = tagset_length2;
				_tmp26_ = i;
				_tmp27_ = _tmp25_[(_tmp26_ * _tmp25__length2) + 1];
				gee_abstract_map_set ((GeeAbstractMap*) _tmp21_, _tmp24_, _tmp27_);
			}
		}
	}
	_tmp28_ = (lua_State*) luaL_newstate ();
	vm = _tmp28_;
	_tmp29_ = vm;
	lua_register (_tmp29_, "sin", _l_sin_lua_cfunction);
	_tmp30_ = g_new0 (gchar*, 0 + 1);
	collections = _tmp30_;
	collections_length1 = 0;
	_collections_size_ = collections_length1;
	{
		gint i;
		i = 0;
		{
			gboolean _tmp31_;
			_tmp31_ = TRUE;
			while (TRUE) {
				gboolean _tmp32_;
				const gchar* _tmp33_;
				gunichar _tmp34_ = 0U;
				gboolean _tmp35_ = FALSE;
				gint start = 0;
				gint end = 0;
				gunichar _tmp36_;
				_tmp32_ = _tmp31_;
				if (!_tmp32_) {
				}
				_tmp31_ = FALSE;
				_tmp33_ = passin;
				_tmp35_ = string_get_next_char (_tmp33_, &i, &_tmp34_);
				nc = _tmp34_;
				if (!_tmp35_) {
					break;
				}
				_tmp36_ = nc;
				if (_tmp36_ == ((gunichar) '{')) {
					gint _tmp37_;
					const gchar* _tmp38_;
					gunichar _tmp39_ = 0U;
					gunichar _tmp40_;
					gchar* _tmp41_ = NULL;
					gchar* _tmp42_;
					gchar* _tmp43_ = NULL;
					gchar* _tmp44_;
					gchar* ltag;
					GeeHashMap* _tmp45_;
					const gchar* _tmp46_;
					gboolean _tmp47_ = FALSE;
					_tmp37_ = i;
					start = _tmp37_;
					_tmp38_ = passin;
					string_get_next_char (_tmp38_, &i, &_tmp39_);
					nc = _tmp39_;
					_tmp40_ = nc;
					_tmp41_ = g_unichar_to_string (_tmp40_);
					_tmp42_ = _tmp41_;
					_tmp43_ = g_strdup_printf ("{%s", _tmp42_);
					_tmp44_ = _tmp43_;
					_g_free0 (_tmp42_);
					ltag = _tmp44_;
					_tmp45_ = tset;
					_tmp46_ = ltag;
					_tmp47_ = gee_abstract_map_has_key ((GeeAbstractMap*) _tmp45_, _tmp46_);
					if (_tmp47_) {
						GeeHashMap* _tmp48_;
						const gchar* _tmp49_;
						gpointer _tmp50_ = NULL;
						gchar* rtag;
						const gchar* _tmp51_;
						gunichar _tmp52_ = 0U;
						_tmp48_ = tset;
						_tmp49_ = ltag;
						_tmp50_ = gee_abstract_map_get ((GeeAbstractMap*) _tmp48_, _tmp49_);
						rtag = (gchar*) _tmp50_;
						_tmp51_ = passin;
						string_get_next_char (_tmp51_, &i, &_tmp52_);
						nc = _tmp52_;
						while (TRUE) {
							gunichar _tmp53_;
							gunichar _tmp54_;
							const gchar* _tmp55_;
							gchar _tmp56_ = '\0';
							const gchar* _tmp68_;
							gunichar _tmp69_ = 0U;
							_tmp53_ = nc;
							if (!(_tmp53_ != ((gunichar) 0))) {
								break;
							}
							_tmp54_ = nc;
							_tmp55_ = rtag;
							_tmp56_ = string_get (_tmp55_, (glong) 0);
							if (_tmp54_ == ((gunichar) _tmp56_)) {
								const gchar* _tmp57_;
								gunichar _tmp58_ = 0U;
								gunichar _tmp59_;
								const gchar* _tmp60_;
								gchar _tmp61_ = '\0';
								_tmp57_ = passin;
								string_get_next_char (_tmp57_, &i, &_tmp58_);
								rc = _tmp58_;
								_tmp59_ = rc;
								_tmp60_ = rtag;
								_tmp61_ = string_get (_tmp60_, (glong) 1);
								if (_tmp59_ == ((gunichar) _tmp61_)) {
									gint _tmp62_;
									gchar** _tmp63_;
									gint _tmp63__length1;
									const gchar* _tmp64_;
									gint _tmp65_;
									gint _tmp66_;
									gchar* _tmp67_ = NULL;
									_tmp62_ = i;
									end = _tmp62_;
									_tmp63_ = collections;
									_tmp63__length1 = collections_length1;
									_tmp64_ = passin;
									_tmp65_ = start;
									_tmp66_ = end;
									_tmp67_ = string_slice (_tmp64_, (glong) (_tmp65_ - 1), (glong) _tmp66_);
									_vala_array_add1 (&collections, &collections_length1, &_collections_size_, _tmp67_);
									break;
								}
							}
							_tmp68_ = passin;
							string_get_next_char (_tmp68_, &i, &_tmp69_);
							nc = _tmp69_;
						}
						_g_free0 (rtag);
					}
					_g_free0 (ltag);
				}
			}
		}
	}
	_tmp70_ = collections;
	_tmp70__length1 = collections_length1;
	{
		gchar** s_collection = NULL;
		gint s_collection_length1 = 0;
		gint _s_collection_size_ = 0;
		gint s_it = 0;
		s_collection = _tmp70_;
		s_collection_length1 = _tmp70__length1;
		for (s_it = 0; s_it < _tmp70__length1; s_it = s_it + 1) {
			gchar* _tmp71_;
			gchar* s = NULL;
			_tmp71_ = g_strdup (s_collection[s_it]);
			s = _tmp71_;
			{
				const gchar* _tmp72_;
				gchar* _tmp73_;
				gchar* _tmp74_;
				gchar* _tmp75_;
				gchar* _tmp76_;
				_tmp72_ = s;
				_tmp73_ = g_strconcat ("--->> ", _tmp72_, NULL);
				_tmp74_ = _tmp73_;
				_tmp75_ = g_strconcat (_tmp74_, "\n", NULL);
				_tmp76_ = _tmp75_;
				g_print ("%s", _tmp76_);
				_g_free0 (_tmp76_);
				_g_free0 (_tmp74_);
				_g_free0 (s);
			}
		}
	}
	result = 0;
	collections = (_vala_array_free (collections, collections_length1, (GDestroyNotify) g_free), NULL);
	_lua_close0 (vm);
	_g_object_unref0 (tset);
	_g_free0 (passin);
	tagset = (_vala_array_free (tagset, tagset_length1 * tagset_length2, (GDestroyNotify) g_free), NULL);
	return result;
}


static void _vala_array_destroy (gpointer array, gint array_length, GDestroyNotify destroy_func) {
	if ((array != NULL) && (destroy_func != NULL)) {
		int i;
		for (i = 0; i < array_length; i = i + 1) {
			if (((gpointer*) array)[i] != NULL) {
				destroy_func (((gpointer*) array)[i]);
			}
		}
	}
}


static void _vala_array_free (gpointer array, gint array_length, GDestroyNotify destroy_func) {
	_vala_array_destroy (array, array_length, destroy_func);
	g_free (array);
}



