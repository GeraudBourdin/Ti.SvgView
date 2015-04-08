/* C++ code produced by gperf version 3.0.3 */
/* Command-line: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/gperf -L C++ -E -t /private/var/folders/0v/slqzg7hs6l74393tj2x_glh80000gn/T/gtwin/SvgView-generated/KrollGeneratedBindings.gperf  */
/* Computed positions: -k'' */

#line 3 "/private/var/folders/0v/slqzg7hs6l74393tj2x_glh80000gn/T/gtwin/SvgView-generated/KrollGeneratedBindings.gperf"


#include <string.h>
#include <v8.h>
#include <KrollBindings.h>

#include "com.geraudbourdin.svgview.SvgViewModule.h"
#include "com.geraudbourdin.svgview.ViewProxy.h"


#line 14 "/private/var/folders/0v/slqzg7hs6l74393tj2x_glh80000gn/T/gtwin/SvgView-generated/KrollGeneratedBindings.gperf"
struct titanium::bindings::BindEntry;
/* maximum key range = 5, duplicates = 0 */

class SvgViewBindings
{
private:
  static inline unsigned int hash (const char *str, unsigned int len);
public:
  static struct titanium::bindings::BindEntry *lookupGeneratedInit (const char *str, unsigned int len);
};

inline /*ARGSUSED*/
unsigned int
SvgViewBindings::hash (register const char *str, register unsigned int len)
{
  return len;
}

struct titanium::bindings::BindEntry *
SvgViewBindings::lookupGeneratedInit (register const char *str, register unsigned int len)
{
  enum
    {
      TOTAL_KEYWORDS = 2,
      MIN_WORD_LENGTH = 35,
      MAX_WORD_LENGTH = 39,
      MIN_HASH_VALUE = 35,
      MAX_HASH_VALUE = 39
    };

  static struct titanium::bindings::BindEntry wordlist[] =
    {
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
#line 17 "/private/var/folders/0v/slqzg7hs6l74393tj2x_glh80000gn/T/gtwin/SvgView-generated/KrollGeneratedBindings.gperf"
      {"com.geraudbourdin.svgview.ViewProxy", ::com::geraudbourdin::svgview::svgview::ViewProxy::bindProxy, ::com::geraudbourdin::svgview::svgview::ViewProxy::dispose},
      {""}, {""}, {""},
#line 16 "/private/var/folders/0v/slqzg7hs6l74393tj2x_glh80000gn/T/gtwin/SvgView-generated/KrollGeneratedBindings.gperf"
      {"com.geraudbourdin.svgview.SvgViewModule", ::com::geraudbourdin::svgview::SvgViewModule::bindProxy, ::com::geraudbourdin::svgview::SvgViewModule::dispose}
    };

  if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
    {
      unsigned int key = hash (str, len);

      if (key <= MAX_HASH_VALUE)
        {
          register const char *s = wordlist[key].name;

          if (*str == *s && !strcmp (str + 1, s + 1))
            return &wordlist[key];
        }
    }
  return 0;
}
#line 18 "/private/var/folders/0v/slqzg7hs6l74393tj2x_glh80000gn/T/gtwin/SvgView-generated/KrollGeneratedBindings.gperf"

