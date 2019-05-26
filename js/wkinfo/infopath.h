#ifndef INFOPATH_H
#define INFOPATH_H

#ifdef __cplusplus
extern "C"
{
#endif

char *locate_manual (const char *manual);
void parse_external_url (const char *url, char **manual, char **node);

#ifdef __cplusplus
} // extern "C"
#endif

#endif // INFOPATH_H
